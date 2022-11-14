@IsTest
private class SetOperationsUtilityTest {
    @IsTest
    static void testUnion() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getUnion(firstSet, secondSet);
        System.debug('@@@@@ Result @@@@ '+result);
    }
}