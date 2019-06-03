Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64E336DD
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 19:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389089132;
	Mon,  3 Jun 2019 17:35:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0589132
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 17:35:49 +0000 (UTC)
Received: from DM3PR12CA0046.namprd12.prod.outlook.com (2603:10b6:0:56::14) by
 CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 17:35:47 +0000
Received: from DM3NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0046.outlook.office365.com
 (2603:10b6:0:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Mon, 3 Jun 2019 17:35:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT006.mail.protection.outlook.com (10.152.82.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Mon, 3 Jun 2019 17:35:47 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 3 Jun 2019
 12:35:46 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Add connector debugfs for "output_bpc"
Date: Mon, 3 Jun 2019 13:35:38 -0400
Message-ID: <20190603173538.22860-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(189003)(199004)(2351001)(4326008)(7696005)(2906002)(36756003)(53936002)(305945005)(68736007)(316002)(81156014)(81166006)(5660300002)(50226002)(8936002)(53416004)(8676002)(51416003)(16586007)(1076003)(47776003)(54906003)(26005)(77096007)(186003)(48376002)(426003)(44832011)(486006)(126002)(476003)(2616005)(336012)(50466002)(14444005)(6916009)(86362001)(356004)(6666004)(70206006)(70586007)(72206003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33c816a0-0d8c-4b73-e5a3-08d6e849e9ca
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12719863B63207FA11CAAC6EEC140@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0057EE387C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MVx6USgK5iPw2qS8s8ElIcnroI6tvuaiHE4DwtaTnUnBaYv0t5bwi+SEykNQXczpzPs/LdruJJgQcR2PV3rPiRi2KzEZLIytCnF1vPzLqPnJaQDihCvYlCIA6QIHWcHRhuKZG57Y1QTtIYbRsMD2RAeB562R39F62NZDKQOrquVSLFQw5nOC/wpQX3Xbv9R9eeCGBp1rZb/tb7MlziO9AJWGuWgLdLXSVI0jpe6RU2drjBQUtIS2LSZMWFXRaW81yg0+uLD53xgQDDRQ5I/j6sx3Vlp9bXwF+R+mSmNRZWES2NSqmPoklSK8nwYbEL209Lih+M7wxDx2CYRH39+ZtxDYhcP++1Fb9RlM/4vWV6QNVe1BeFpjE8CfXQ4MV1MraJ2/MWDctysgx9InjMGVlNGRvXBw9urAwDp+hmUGK8Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2019 17:35:47.1028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c816a0-0d8c-4b73-e5a3-08d6e849e9ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdg3SIpaLSR6+zvKF2/1per61VlVT4QMW2mdXOC7umk=;
 b=c9TlmOxpRkDyNX+ljlR8/W2XRuESdnBaSoBcsALyDSRnT9W4e/0qKg7TvPfVgY61UL1yU0P9e8xwvRh9CuFYC12+XKRr5V/rbsTMZqgqdJDIPFkm7/RnuHwpOTGq1FylrGeXLcf9UEK3VRvDIW8IJ6tVCTpmDwb7xLz5EIqMgDA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyB3aWxsIGJlIHVzZWZ1bCBmb3IgdmVyaWZ5aW5nIHdoZXRoZXIgd2UgZW50ZXIg
dGhlIGNvcnJlY3Qgb3V0cHV0CmNvbG9yIGRlcHRoIGZyb20gSUdULgoKW0hvd10KTG9ja3MgdGhl
IGNvbm5lY3RvciBhbmQgYXNzb2NpYXRlZCBDUlRDIGlmIGF2YWlsYWJsZSBhbmQgb3V0cHV0cwp0
aGUgY3VycmVudCBhbmQgbWF4aW11bSBvdXRwdXQgYnBjIHZhbHVlcy4KCkV4YW1wbGU6CgpjYXQg
L3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvRFAtMS9vdXRwdXRfYnBjCkN1cnJlbnQ6IDgKTWF4aW11
bTogMTAKCkNoYW5nZS1JZDogSWM4ODFjMGM3MjljNTQ0NGI4MDI1NmNjZmU1NWFjNTJjZWMzNDUz
ODgKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMg
PG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMgfCA3NCArKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2Zz
LmMKaW5kZXggMWQ1ZmM1YWQzYmVlLi4wZGU4NmE3ZTMxYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMK
QEAgLTY3Miw2ICs2NzIsNzQgQEAgc3RhdGljIHNzaXplX3QgZHBfcGh5X3Rlc3RfcGF0dGVybl9k
ZWJ1Z2ZzX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXMKIAlyZXR1cm4gYnl0
ZXNfZnJvbV91c2VyOwogfQogCisvKgorICogUmV0dXJucyB0aGUgY3VycmVudCBhbmQgbWF4aW11
bSBvdXRwdXQgYnBjIGZvciB0aGUgY29ubmVjdG9yLgorICogRXhhbXBsZSB1c2FnZTogY2F0IC9z
eXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEvb3V0cHV0X2JwYworICovCitzdGF0aWMgaW50IG91
dHB1dF9icGNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCit7CisJc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IG0tPnByaXZhdGU7CisJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2OworCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IE5VTEw7
CisJc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX2NydGNfc3RhdGUgPSBOVUxMOworCWludCByZXMg
PSAtRU5PREVWOworCXVuc2lnbmVkIGludCBicGM7CisKKwltdXRleF9sb2NrKCZkZXYtPm1vZGVf
Y29uZmlnLm11dGV4KTsKKwlkcm1fbW9kZXNldF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5l
Y3Rpb25fbXV0ZXgsIE5VTEwpOworCisJaWYgKGNvbm5lY3Rvci0+c3RhdGUgPT0gTlVMTCkKKwkJ
Z290byB1bmxvY2s7CisKKwljcnRjID0gY29ubmVjdG9yLT5zdGF0ZS0+Y3J0YzsKKwlpZiAoY3J0
YyA9PSBOVUxMKQorCQlnb3RvIHVubG9jazsKKworCWRybV9tb2Rlc2V0X2xvY2soJmNydGMtPm11
dGV4LCBOVUxMKTsKKwlpZiAoY3J0Yy0+c3RhdGUgPT0gTlVMTCkKKwkJZ290byB1bmxvY2s7CisK
KwlkbV9jcnRjX3N0YXRlID0gdG9fZG1fY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CisJaWYgKGRt
X2NydGNfc3RhdGUtPnN0cmVhbSA9PSBOVUxMKQorCQlnb3RvIHVubG9jazsKKworCWlmIChjb25u
ZWN0b3ItPnN0YXR1cyAhPSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkKKwkJcmV0dXJuIC1F
Tk9ERVY7CisKKwlzd2l0Y2ggKGRtX2NydGNfc3RhdGUtPnN0cmVhbS0+dGltaW5nLmRpc3BsYXlf
Y29sb3JfZGVwdGgpIHsKKwljYXNlIENPTE9SX0RFUFRIXzY2NjoKKwkJYnBjID0gNjsKKwkJYnJl
YWs7CisJY2FzZSBDT0xPUl9ERVBUSF84ODg6CisJCWJwYyA9IDg7CisJCWJyZWFrOworCWNhc2Ug
Q09MT1JfREVQVEhfMTAxMDEwOgorCQlicGMgPSAxMDsKKwkJYnJlYWs7CisJY2FzZSBDT0xPUl9E
RVBUSF8xMjEyMTI6CisJCWJwYyA9IDEyOworCQlicmVhazsKKwljYXNlIENPTE9SX0RFUFRIXzE2
MTYxNjoKKwkJYnBjID0gMTY7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWdvdG8gdW5sb2NrOwor
CX0KKworCXNlcV9wcmludGYobSwgIkN1cnJlbnQ6ICV1XG4iLCBicGMpOworCXNlcV9wcmludGYo
bSwgIk1heGltdW06ICV1XG4iLCBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGMpOworCXJlcyA9
IDA7CisKK3VubG9jazoKKwlpZiAoY3J0YykKKwkJZHJtX21vZGVzZXRfdW5sb2NrKCZjcnRjLT5t
dXRleCk7CisKKwlkcm1fbW9kZXNldF91bmxvY2soJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlv
bl9tdXRleCk7CisJbXV0ZXhfdW5sb2NrKCZkZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKKworCXJl
dHVybiByZXM7Cit9CisKIC8qCiAgKiBSZXR1cm5zIHRoZSBtaW4gYW5kIG1heCB2cnIgdmZyZXEg
dGhyb3VnaCB0aGUgY29ubmVjdG9yJ3MgZGVidWdmcyBmaWxlLgogICogRXhhbXBsZSB1c2FnZTog
Y2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEvdnJyX3JhbmdlCkBAIC03MzAsOCArNzk4
LDYgQEAgc3RhdGljIHNzaXplX3QgZHBfc2RwX21lc3NhZ2VfZGVidWdmc193cml0ZShzdHJ1Y3Qg
ZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKmIKIAlyZXR1cm4gd3JpdGVfc2l6ZTsKIH0KIAot
REVGSU5FX1NIT1dfQVRUUklCVVRFKHZycl9yYW5nZSk7Ci0KIHN0YXRpYyBzc2l6ZV90IGRwX2Rw
Y2RfYWRkcmVzc193cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwK
IAkJCQkgc2l6ZV90IHNpemUsIGxvZmZfdCAqcG9zKQogewpAQCAtODE0LDYgKzg4MCw5IEBAIHN0
YXRpYyBzc2l6ZV90IGRwX2RwY2RfZGF0YV9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNl
ciAqYnVmLAogCXJldHVybiByZWFkX3NpemUgLSByOwogfQogCitERUZJTkVfU0hPV19BVFRSSUJV
VEUob3V0cHV0X2JwYyk7CitERUZJTkVfU0hPV19BVFRSSUJVVEUodnJyX3JhbmdlKTsKKwogc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgZHBfbGlua19zZXR0aW5nc19kZWJ1Z2Zz
X2ZvcHMgPSB7CiAJLm93bmVyID0gVEhJU19NT0RVTEUsCiAJLnJlYWQgPSBkcF9saW5rX3NldHRp
bmdzX3JlYWQsCkBAIC04NjYsNiArOTM1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7CiAJCXsi
bGlua19zZXR0aW5ncyIsICZkcF9saW5rX3NldHRpbmdzX2RlYnVnZnNfZm9wc30sCiAJCXsicGh5
X3NldHRpbmdzIiwgJmRwX3BoeV9zZXR0aW5nc19kZWJ1Z2ZzX2ZvcH0sCiAJCXsidGVzdF9wYXR0
ZXJuIiwgJmRwX3BoeV90ZXN0X3BhdHRlcm5fZm9wc30sCisJCXsib3V0cHV0X2JwYyIsICZvdXRw
dXRfYnBjX2ZvcHN9LAogCQl7InZycl9yYW5nZSIsICZ2cnJfcmFuZ2VfZm9wc30sCiAJCXsic2Rw
X21lc3NhZ2UiLCAmc2RwX21lc3NhZ2VfZm9wc30sCiAJCXsiYXV4X2RwY2RfYWRkcmVzcyIsICZk
cF9kcGNkX2FkZHJlc3NfZGVidWdmc19mb3BzfSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
