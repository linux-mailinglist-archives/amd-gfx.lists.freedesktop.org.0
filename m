Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5437F05
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6318689850;
	Thu,  6 Jun 2019 20:55:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790083.outbound.protection.outlook.com [40.107.79.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C83A89850
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:07 +0000 (UTC)
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:51::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Thu, 6 Jun 2019 20:55:06 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:04 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/24] drm/amd/display: Update link rate from DPCD 10
Date: Thu, 6 Jun 2019 16:54:39 -0400
Message-ID: <20190606205501.16505-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(47776003)(50466002)(48376002)(8936002)(356004)(36756003)(53416004)(81156014)(50226002)(8676002)(81166006)(6916009)(6666004)(305945005)(53936002)(2906002)(5660300002)(1076003)(14444005)(4326008)(336012)(70586007)(70206006)(68736007)(316002)(16586007)(15650500001)(2351001)(76176011)(72206003)(478600001)(7696005)(51416003)(77096007)(26005)(186003)(2616005)(446003)(11346002)(486006)(126002)(476003)(426003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6df347-793b-4ee8-b54e-08d6eac14108
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0060460FE297FD369E933D12F9170@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: m1xclqyoG4bG7n4SL7p284aqWHdSdfe6lOr0zrBia524avqJyOrQLBuhmn4D8z4EAdqepsRPTGU8bsb9Da8El4hgXlrf/FfwD2k5A7yuy5g8KfODONYPzqThTZmAgAHqCtIQfVUFqmy9lF/HU8EzRd48RD13QIrd+MaHxEIHOA35KNLXazhV9Q0BmGyeA691eX31K6lMQwpo2Zf9cFzUALoTU2/B2Ezz9AftE7uQVYjH807/kFzA6s/EIG18R7Ms3QTFyYxbTEF2w1drvmiIxc51ZSzB/cU8N6mcnNzdc9uoWRFmT34XV6nbMSdBhZQ/iIeW8J4eex9MBbwR3Px2wfivHrLEVhW3YGZ1SAKAIV9BRSgMyaFm15i28V/upXbmqWg7V5TkUSdwKc5q17MoRwePCi4ZWHmkuH1TTpQgcLs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:05.9110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6df347-793b-4ee8-b54e-08d6eac14108
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orBMaMMoqVXfGrXDHpYVxiapVRELD+E8E/nrf4Czbto=;
 b=UGCaQbIXmO8Q7qsBnFdtMP0G1dhk6FLrQw4c+o+uzK0KTswpWvXbNvCppeYpkHoyQuEtYDgZAQS4AQElMZ7avdq8YdFbcCkqxmpfySTc+Dp1OpiRHjwlzIP+D/+UQKroYRcGTbsnSAwLr25TvPeA/GoGSQImH7EAkHoRoXE4bf8=
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
Cc: Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldClNv
bWUgcGFuZWxzIHJldHVybiBhIGxpbmsgcmF0ZSBvZiAwICh1bmtub3duKSBpbiBEUENEIDAuIElu
IHRoaXMgY2FzZSwKYW4gYXBwcm9wcmlhdGUgbW9kZSBjYW5ub3QgYmUgc2V0LCBhbmQgY2VydGFp
biBwYW5lbHMgd2lsbCBzaG93CmNvcnJ1cHRpb24gYXMgdGhleSBhcmUgZm9yY2VkIHRvIHVzZSBh
IG1vZGUgdGhleSBkbyBub3Qgc3VwcG9ydC4KCltIT1ddClJlYWQgRFBDRCAxMCBpbiB0aGUgY2Fz
ZSB3aGVyZSBzdXBwb3J0ZWQgbGluayByYXRlIGZyb20gRFBDRCAwIGlzCnVua25vd24sIGFuZCBw
YXNzIHRoYXQgdmFsdWUgb24gdG8gdGhlIHJlcG9ydGVkIGxpbmsgcmF0ZS4KVGhpcyByZS1pbnRy
b2R1Y2VzIGJlaGF2aW91ciBwcmVzZW50IGluIHByZXZpb3VzIHZlcnNpb25zIHRoYXQgYXBwZWFy
cwp0byBoYXZlIGJlZW4gYWNjaWRlbnRhbGx5IHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5OiBXZXNs
ZXkgQ2hhbG1lcnMgPFdlc2xleS5DaGFsbWVyc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9u
eSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8
Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rX2RwLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKaW5kZXggNjVkNmNhZWRiZDgyLi4yZDUxOWU1
ZmMzZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RwLmMKQEAgLTE2MjQsOCArMTYyNCw3IEBAIHN0YXRpYyBib29sIGRlY2lkZV9lZHBfbGlu
a19zZXR0aW5ncyhzdHJ1Y3QgZGNfbGluayAqbGluaywgc3RydWN0IGRjX2xpbmtfc2V0dGluCiAJ
dWludDMyX3QgbGlua19idzsKIAogCWlmIChsaW5rLT5kcGNkX2NhcHMuZHBjZF9yZXYucmF3IDwg
RFBDRF9SRVZfMTQgfHwKLQkJCWxpbmstPmRwY2RfY2Fwcy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0
ZXNfY291bnQgPT0gMCB8fAotCQkJbGluay0+ZGMtPmNvbmZpZy5vcHRpbWl6ZV9lZHBfbGlua19y
YXRlID09IGZhbHNlKSB7CisJCQlsaW5rLT5kcGNkX2NhcHMuZWRwX3N1cHBvcnRlZF9saW5rX3Jh
dGVzX2NvdW50ID09IDApIHsKIAkJKmxpbmtfc2V0dGluZyA9IGxpbmstPnZlcmlmaWVkX2xpbmtf
Y2FwOwogCQlyZXR1cm4gdHJ1ZTsKIAl9CkBAIC0yNjA5LDcgKzI2MDgsOCBAQCB2b2lkIGRldGVj
dF9lZHBfc2lua19jYXBzKHN0cnVjdCBkY19saW5rICpsaW5rKQogCW1lbXNldChzdXBwb3J0ZWRf
bGlua19yYXRlcywgMCwgc2l6ZW9mKHN1cHBvcnRlZF9saW5rX3JhdGVzKSk7CiAKIAlpZiAobGlu
ay0+ZHBjZF9jYXBzLmRwY2RfcmV2LnJhdyA+PSBEUENEX1JFVl8xNCAmJgotCQkJbGluay0+ZGMt
PmNvbmZpZy5vcHRpbWl6ZV9lZHBfbGlua19yYXRlKSB7CisJCQkobGluay0+ZGMtPmNvbmZpZy5v
cHRpbWl6ZV9lZHBfbGlua19yYXRlIHx8CisJCQlsaW5rLT5yZXBvcnRlZF9saW5rX2NhcC5saW5r
X3JhdGUgPT0gTElOS19SQVRFX1VOS05PV04pKSB7CiAJCS8vIFJlYWQgRFBDRCAwMDAxMGggLSAw
MDAxRmggMTYgYnl0ZXMgYXQgb25lIHNob3QKIAkJY29yZV9saW5rX3JlYWRfZHBjZChsaW5rLCBE
UF9TVVBQT1JURURfTElOS19SQVRFUywKIAkJCQkJCQlzdXBwb3J0ZWRfbGlua19yYXRlcywgc2l6
ZW9mKHN1cHBvcnRlZF9saW5rX3JhdGVzKSk7CkBAIC0yNjI0LDYgKzI2MjQsOSBAQCB2b2lkIGRl
dGVjdF9lZHBfc2lua19jYXBzKHN0cnVjdCBkY19saW5rICpsaW5rKQogCQkJCWxpbmtfcmF0ZSA9
IGxpbmtSYXRlSW5LSHpUb0xpbmtSYXRlTXVsdGlwbGllcihsaW5rX3JhdGVfaW5fa2h6KTsKIAkJ
CQlsaW5rLT5kcGNkX2NhcHMuZWRwX3N1cHBvcnRlZF9saW5rX3JhdGVzW2xpbmstPmRwY2RfY2Fw
cy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291bnRdID0gbGlua19yYXRlOwogCQkJCWxpbmst
PmRwY2RfY2Fwcy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291bnQrKzsKKworCQkJCWlmIChs
aW5rLT5yZXBvcnRlZF9saW5rX2NhcC5saW5rX3JhdGUgPCBsaW5rX3JhdGUpCisJCQkJCWxpbmst
PnJlcG9ydGVkX2xpbmtfY2FwLmxpbmtfcmF0ZSA9IGxpbmtfcmF0ZTsKIAkJCX0KIAkJfQogCX0K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
