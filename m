Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B841DAEC75
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF046E8F9;
	Tue, 10 Sep 2019 13:55:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A29889580
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASdME47rlMMfjMr+Txy39mvOkG3WzFm9spjAy02+0hxVr1vq92b3lG2beot5iTh90s63Wnzyf03/B1UPfByEpgyQVsbYhZwE7ZxVesyk8TUEK8Ru+IofaYV00VA1OBhE6MJhFFqfSuNIziF5XXxFH9i3BhSLMKs8G1cUcHXcjenBTrVy43RbJQM/pVPybJ9AyDfNySlnNBlJ/2VUK3hOrSQRaY/VNEHpiqSKG++VFo2qL9tqzvWBedKksPe0HYNZiXJfugOLxeJmrfHSB1ozWiOfEw3BNAejyux8wjkpL0mf867hNXhApIwXLOqfm6fBGoaxLsptYJBIT5pWGQ4Mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x/AHNEeGjBP3RNiaFSdNLhK1m/FYKtab+yEQkg3L0o=;
 b=QuivJ5s9wOCHx/6YWi4YMSxVOPLaFg1wsVZUyRnYAybAlkBwsIzDlG8MfrwrmHSg8h5KwbUGgm9SXpxfJhKwHCuDRXiA5VX7YPKraWBxGt1TKqWsIcfjNir7r/617L4CEaVm3/gmBVR+peLIAKDzP4sREksf/t3ScbMeKzM6PARDvUmvKtjphNcVpQDyQHc5Tr+4H8nh+2x6HjRtVoQ6hOts9H82YxR8FMKSz9F22hIKXm6DyvAMwNhq6sIEvGpmgQRHiwsJ+kRXKP2yrlQYqj77fkJsoTGZv7ks3ZNRoKqGETZL50c+R8SgMoAsU0t70dsWK/z+ETivj6kICzTAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by BN6PR1201MB2496.namprd12.prod.outlook.com (2603:10b6:404:a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Tue, 10 Sep
 2019 13:55:05 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:00 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/25] drm/amd/display: Optimize clocks on clock change
Date: Tue, 10 Sep 2019 09:54:37 -0400
Message-ID: <20190910135445.18300-18-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(53936002)(47776003)(8676002)(81166006)(81156014)(2870700001)(54906003)(316002)(2876002)(26005)(14444005)(51416003)(186003)(76176011)(49486002)(6916009)(2616005)(126002)(446003)(5660300002)(1076003)(426003)(11346002)(476003)(48376002)(50466002)(486006)(6666004)(356004)(478600001)(86362001)(8936002)(305945005)(50226002)(2906002)(4326008)(36756003)(70206006)(2351001)(336012)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2496; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe429392-b8f2-47c4-e4a6-08d735f67bd4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR1201MB2496; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2496:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2496BE818D61F90B9FB07F8F82B60@BN6PR1201MB2496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YA4IdPNye4pm0meLFRLVW1Kfw0nhR5u+TWBA3z2TIbL02Gekn3MKkNbp21gAbAJlOnxJsB0jdLh/Ch+NWOSvfnveBNe3TmrCeuWkJT4oaArgqTEsL0Gja8jx6bzzg0/7FHJZKxfSZ6t+ACUmorVQ7c2Gj2ZZXtSmgxNKRqSU2q/gw3U/Dwex/aA+cNGihjEF172epOw0MU2FEEw0bspdXUp9IgXPatZ3B+a8ppFKckDXPVr0qjLWEDUqOtCbqTRUqfWtR6tF9k4dp4zUpl4MkB35ew05WgC5gy2vxou30YgGINC0uv1a7PNsnu37tf1ieCG/8dIE3B47HiT1jF7AmId7/8T5SbTBcrn5T+e7EltK/HSV12KHfIv6yhPSDsx986ikODi88qmUW1rFmohUhMBq6LfG0EJ7TBBNLExnBaE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:05.0019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe429392-b8f2-47c4-e4a6-08d735f67bd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2496
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x/AHNEeGjBP3RNiaFSdNLhK1m/FYKtab+yEQkg3L0o=;
 b=ARIggxA7we+QkBmIBpp4r+kJTjnBIuFKVxPySwIcJCLpFhK37u87r3IhpFV7Qjg7xQqQYpeLbQSN8sE7MIdezvTXloMaTCekWv1QdThy7bWqgFB9+rxLE/+ztAGjez2YweZ/FBnZry+93n4QZWDBp0dVhLDADhK9mGEZRpWPr2A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldClBy
ZXNlbnRseSwgdGhlcmUgaXMgbm8gd2F5IGZvciBjbG9ja3MgdG8gYmUgbG93ZXJlZCwgb25seSBy
YWlzZWQuCgpbSE9XXQpDb21wYXJlIGNsb2NrIHN0YXR1cyBhZ2FpbnN0IHByZXZpb3VzIGtub3du
IGNsb2NrIHN0YXR1cywgYW5kIG9wdGltaXplCmlmIGRpZmZlcmVudC4KVGhpcyByZXF1aXJlcyBy
ZS1vcmRlcmluZyB0aGUgbGF5b3V0IG9mIHRoZSBkY19jbG9ja3Mgc3RydWN0dXJlLCBhcyB0aGUK
Y3VycmVudCBvcmRlcmluZyBhbGxvd3MgaWRlbnRpY2FsIGNsb2NrIHN0YXRlcyB0byBhcHBlYXIg
ZGlmZmVyZW50LgoKU2lnbmVkLW9mZi1ieTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1l
cnNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tl
ZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAg
ICAgfCA4ICsrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCA4
ZWM4MDE1MTYzNmQuLjBkN2VmODliMTdhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jCkBAIC0xNjQzLDYgKzE2NDMsOSBAQCBlbnVtIHN1cmZhY2VfdXBkYXRlX3R5
cGUgZGNfY2hlY2tfdXBkYXRlX3N1cmZhY2VzX2Zvcl9zdHJlYW0oCiAJCQl1cGRhdGVzW2ldLnN1
cmZhY2UtPnVwZGF0ZV9mbGFncy5yYXcgPSAweEZGRkZGRkZGOwogCX0KIAorCWlmICh0eXBlID09
IFVQREFURV9UWVBFX0ZBU1QgJiYgbWVtY21wKCZkYy0+Y3VycmVudF9zdGF0ZS0+YndfY3R4LmJ3
LmRjbi5jbGssICZkYy0+Y2xrX21nci0+Y2xrcywgb2Zmc2V0b2Yoc3RydWN0IGRjX2Nsb2Nrcywg
cHJldl9wX3N0YXRlX2NoYW5nZV9zdXBwb3J0KSkgIT0gMCkKKwkJZGMtPm9wdGltaXplZF9yZXF1
aXJlZCA9IHRydWU7CisKIAlyZXR1cm4gdHlwZTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGMuaAppbmRleCAzMGVmMzFhNzg4ZjguLmM2NWYzNGFhMjUyMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTI1MiwxMSArMjUyLDcgQEAgZW51bSB3bV9yZXBvcnRfbW9k
ZSB7CiAgKi8KIHN0cnVjdCBkY19jbG9ja3MgewogCWludCBkaXNwY2xrX2toejsKLQlpbnQgbWF4
X3N1cHBvcnRlZF9kcHBjbGtfa2h6OwotCWludCBtYXhfc3VwcG9ydGVkX2Rpc3BjbGtfa2h6Owog
CWludCBkcHBjbGtfa2h6OwotCWludCBid19kcHBjbGtfa2h6OyAvKmEgY29weSBvZiBkcHBjbGtf
a2h6Ki8KLQlpbnQgYndfZGlzcGNsa19raHo7CiAJaW50IGRjZmNsa19raHo7CiAJaW50IHNvY2Ns
a19raHo7CiAJaW50IGRjZmNsa19kZWVwX3NsZWVwX2toejsKQEAgLTI3MCw2ICsyNjYsMTAgQEAg
c3RydWN0IGRjX2Nsb2NrcyB7CiAJICogb3B0aW1pemF0aW9uIHJlcXVpcmVkCiAJICovCiAJYm9v
bCBwcmV2X3Bfc3RhdGVfY2hhbmdlX3N1cHBvcnQ7CisJaW50IG1heF9zdXBwb3J0ZWRfZHBwY2xr
X2toejsKKwlpbnQgbWF4X3N1cHBvcnRlZF9kaXNwY2xrX2toejsKKwlpbnQgYndfZHBwY2xrX2to
ejsgLyphIGNvcHkgb2YgZHBwY2xrX2toeiovCisJaW50IGJ3X2Rpc3BjbGtfa2h6OwogfTsKIAog
c3RydWN0IGRjX2J3X3ZhbGlkYXRpb25fcHJvZmlsZSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
