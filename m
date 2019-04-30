Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33E10176
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCD189232;
	Tue, 30 Apr 2019 21:09:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690078.outbound.protection.outlook.com [40.107.69.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E1289232
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:52 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by CH2PR12MB3750.namprd12.prod.outlook.com (2603:10b6:610:25::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:09:51 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/20] drm/amd/display: fix multi display seamless boot case
Date: Tue, 30 Apr 2019 17:09:04 -0400
Message-ID: <20190430210938.32335-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(1076003)(8936002)(186003)(316002)(478600001)(26005)(5660300002)(16586007)(36756003)(7696005)(2351001)(51416003)(14444005)(77096007)(72206003)(53416004)(86362001)(76176011)(2616005)(2906002)(81166006)(81156014)(11346002)(446003)(47776003)(476003)(426003)(48376002)(336012)(53936002)(8676002)(305945005)(70206006)(68736007)(70586007)(6666004)(356004)(50226002)(486006)(50466002)(4326008)(126002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3750; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb340df5-9851-4d99-f13f-08d6cdb02f14
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CH2PR12MB3750; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3750:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3750816180176DDF69623207F93A0@CH2PR12MB3750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: w+8sR0KSy5TQidAWR0oL8163zG4FxVmOvVKqNwtmSEwDnbOKGX3ZUve/5GuQZesAIB30u7WpHZYHk/ub2q4ZO0Vpm5TcWtjHxuKLmXsdKPN4DSu0Hr32ORt0GKIqwDaVxFTN/mFv1vV9laIQRfxn/uwQ/rnFf5BDVf0xJtEm+nbuc4qpVLUeHfyExYganaLb555QZsZSp8IUPgjK789SPTxEhhrtUNEmRGWllCNv/ymI0Ud/jYf+ApZToS/Es6aLqJqbyMIwQ9uyQYDfUQ89qEGcSwPY7j4FipL9SIM++yY3o4W/E3zh1FWJApU8RU9a1342Xj3w4vhiP4vLh8JpQ4D5uvBSovGfXPT0NGw9MwxTJA/k/ZP33othsffHlLnYJZWgjmJwmOKUWsVvfi8b/2oWbxkjdVt+41Um7C27kWk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:50.5462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb340df5-9851-4d99-f13f-08d6cdb02f14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTfLu4Pufty6tnnpQL4mrhFn9gztrho/wUBWComKAOo=;
 b=DsybkNGAa9rawUbNc2kVf3z0uAoxa4XqaKM6bLNy4/+I0w29Cif+ifmvGZdxciaqkFNTVEN62JAHhySN4emHPhvnpPpm+cyl2i1n78Gg9oCQoad0fQip9kxE8M66txErEUMm5J2iryHHhdeXRRyiXCrz72r681run4Mwy6ybOZ0=
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
Cc: Anthony Koo <anthony.koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPGFudGhvbnkua29vQGFtZC5jb20+CgpbV2h5XQpUaGVyZSBpcyBh
IHNjZW5hcmlvIHRoYXQgY2F1c2VzIGVEUCB0byBiZWNvbWUgYmxhbmsgaWYKdGhlcmUgYXJlIG11
bHRpcGxlIGRpc3BsYXlzIGNvbm5lY3RlZCwgYW5kIHRoZSBleHRlcm5hbApkaXNwbGF5IGlzIHNl
dCBhcyB0aGUgcHJpbWFyeSBkaXNwbGF5IHN1Y2ggdGhhdCB0aGUgZmlyc3QKZmxpcCBjb21lcyB0
byB0aGUgZXh0ZXJuYWwgZGlzcGxheS4KCkluIHRoaXMgc2NlbmFyaW8sIHdlIGNhbGwgb3VyIG9w
dGltaXplIGZ1bmN0aW9uIGJlZm9yZQp0aGUgZURQIGV2ZW4gaGFzIGEgY2hhbmNlIHRvIGZsaXAu
CgpbSG93XQpUaGVyZSBpcyBhIGNoZWNrIHRoYXQgcHJldmVudHMgYmFuZHdpZHRoIG9wdGltaXpl
IGZyb20Kb2NjdXJyaW5nIGJlZm9yZSBmaXJzdCBmbGlwIGlzIGNvbXBsZXRlIG9uIHRoZSBzZWFt
bGVzcyBib290CmRpc3BsYXkuCkJ1dCBhY3R1YWxseSBpdCBhc3N1bWVkIHRoZSBzZWFtbGVzcyBi
b290IGRpc3BsYXkgaXMgdGhlCmZpcnN0IG9uZSB0byBmbGlwLiBCdXQgaW4gdGhpcyBzY2VuYXJp
byBpdCBpcyBub3QuCk1vZGlmeSB0aGUgY2hlY2sgdG8gZW5zdXJlIHRoZSBzdGVhbSB3aXRoIHRo
ZSBzZWFtbGVzcwpib290IGZsYWcgc2V0IGlzIHRoZSBvbmUgdGhhdCBoYXMgY29tcGxldGVkIHRo
ZSBmaXJzdCBmbGlwLgoKQ2hhbmdlLUlkOiBJMGE3MzM3MDc3ZWFhODUzMGU3YzAxZWE3NWI3YjIz
MjYxNTliYzQ4ZApTaWduZWQtb2ZmLWJ5OiBBbnRob255IEtvbyA8YW50aG9ueS5rb29AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDE0ICsrKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDcxYTEzZWI3MzNiOS4uMDQ2MzViN2Ey
N2M3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTExNTAs
OSArMTE1MCw2IEBAIHN0YXRpYyBlbnVtIGRjX3N0YXR1cyBkY19jb21taXRfc3RhdGVfbm9fY2hl
Y2soc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjCiAJCWNvbnN0IHN0cnVjdCBkY19s
aW5rICpsaW5rID0gY29udGV4dC0+c3RyZWFtc1tpXS0+bGluazsKIAkJc3RydWN0IGRjX3N0cmVh
bV9zdGF0dXMgKnN0YXR1czsKIAotCQlpZiAoY29udGV4dC0+c3RyZWFtc1tpXS0+YXBwbHlfc2Vh
bWxlc3NfYm9vdF9vcHRpbWl6YXRpb24pCi0JCQljb250ZXh0LT5zdHJlYW1zW2ldLT5hcHBseV9z
ZWFtbGVzc19ib290X29wdGltaXphdGlvbiA9IGZhbHNlOwotCiAJCWlmICghY29udGV4dC0+c3Ry
ZWFtc1tpXS0+bW9kZV9jaGFuZ2VkKQogCQkJY29udGludWU7CiAKQEAgLTE4MDQsMTAgKzE4MDEs
MTUgQEAgc3RhdGljIHZvaWQgY29tbWl0X3BsYW5lc19mb3Jfc3RyZWFtKHN0cnVjdCBkYyAqZGMs
CiAJaWYgKGRjLT5vcHRpbWl6ZV9zZWFtbGVzc19ib290ICYmIHN1cmZhY2VfY291bnQgPiAwKSB7
CiAJCS8qIE9wdGltaXplIHNlYW1sZXNzIGJvb3QgZmxhZyBrZWVwcyBjbG9ja3MgYW5kIHdhdGVy
bWFya3MgaGlnaCB1bnRpbAogCQkgKiBmaXJzdCBmbGlwLiBBZnRlciBmaXJzdCBmbGlwLCBvcHRp
bWl6YXRpb24gaXMgcmVxdWlyZWQgdG8gbG93ZXIKLQkJICogYmFuZHdpZHRoLgorCQkgKiBiYW5k
d2lkdGguIEltcG9ydGFudCB0byBub3RlIHRoYXQgaXQgaXMgZXhwZWN0ZWQgVUVGSSB3aWxsCisJ
CSAqIG9ubHkgbGlnaHQgdXAgYSBzaW5nbGUgZGlzcGxheSBvbiBQT1NULCB0aGVyZWZvcmUgd2Ug
b25seSBleHBlY3QKKwkJICogb25lIHN0cmVhbSB3aXRoIHNlYW1sZXNzIGJvb3QgZmxhZyBzZXQu
CiAJCSAqLwotCQlkYy0+b3B0aW1pemVfc2VhbWxlc3NfYm9vdCA9IGZhbHNlOwotCQlkYy0+b3B0
aW1pemVkX3JlcXVpcmVkID0gdHJ1ZTsKKwkJaWYgKHN0cmVhbS0+YXBwbHlfc2VhbWxlc3NfYm9v
dF9vcHRpbWl6YXRpb24pIHsKKwkJCXN0cmVhbS0+YXBwbHlfc2VhbWxlc3NfYm9vdF9vcHRpbWl6
YXRpb24gPSBmYWxzZTsKKwkJCWRjLT5vcHRpbWl6ZV9zZWFtbGVzc19ib290ID0gZmFsc2U7CisJ
CQlkYy0+b3B0aW1pemVkX3JlcXVpcmVkID0gdHJ1ZTsKKwkJfQogCX0KIAogCWlmICh1cGRhdGVf
dHlwZSA9PSBVUERBVEVfVFlQRV9GVUxMICYmICFkYy0+b3B0aW1pemVfc2VhbWxlc3NfYm9vdCkg
ewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
