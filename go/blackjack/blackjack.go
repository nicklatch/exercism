package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ten", "jack", "queen", "king":
		return 10
	case "ace":
		return 11
	case "nine":
		return 9
	case "eight":
		return 8
	case "seven":
		return 7
	case "six":
		return 6
	case "five":
		return 5
	case "four":
		return 4
	case "three":
		return 3
	case "two":
		return 2
	default:
		return 0
	}
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	sum := func() int { return ParseCard(card1) + ParseCard(card2) }

	dealerHasTenOrEleven := func() bool {
		dealerCardVal := ParseCard(dealerCard)
		return dealerCardVal == 10 || dealerCardVal == 11
	}

	switch {
	case card1 == "ace" && card2 == "ace":
		return "P"
	case sum() == 21 && !dealerHasTenOrEleven():
		return "W"
	case sum() >= 17 && sum() <= 20:
		return "S"
	case sum() >= 12 && sum() <= 16:
		if ParseCard(dealerCard) >= 7 {
			return "H"
		} else {
			return "S"
		}
	case sum() <= 11:
		return "H"
	default:
		return "S"
	}
}
