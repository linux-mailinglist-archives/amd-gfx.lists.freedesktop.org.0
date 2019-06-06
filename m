Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A2A37F0E
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA04B898CE;
	Thu,  6 Jun 2019 20:55:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AF08989E
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:23 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:21 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:20 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:07 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/24] drm/amd/display: fix issue with eDP not detected on
 driver load
Date: Thu, 6 Jun 2019 16:54:48 -0400
Message-ID: <20190606205501.16505-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(7696005)(51416003)(14444005)(316002)(26005)(36756003)(446003)(2906002)(426003)(486006)(6916009)(11346002)(5660300002)(76176011)(186003)(47776003)(476003)(2616005)(126002)(2351001)(1076003)(68736007)(70586007)(77096007)(70206006)(305945005)(86362001)(336012)(16586007)(8936002)(48376002)(356004)(6666004)(81166006)(81156014)(8676002)(50466002)(72206003)(4326008)(478600001)(53416004)(50226002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2664; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524e9a06-88eb-4952-2a57-08d6eac149ff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2664; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2664:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26642F0AD700936ED652BD8AF9170@BYAPR12MB2664.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lfcx+v+EekGItWA/kQ3lHOZkj1yMEjvmEH1Pu98m6mN3lvmorPXqybpnkWZrpe//MsyQm6jSK3zSN9A92GqltAOHCP0Wf2JFH+LyUm5+XyPMZd4n4Bo+ocLA1E7QNNAAWpRCCsBDhMB9XQQx/VpC0wgRsFgIKs5lb1ye2UJvNIIqWJo1R8E7adRV6lA9nznKhsIJSMI/kDmWRw/OvV0mL+w0I+EBrJ0RpRwPFbKinksV3t2O1zlYzhbNRE5lqrhlfdx238VnXNhnf7hfFYF2rAdZaGFbB4p1/nhsc9yqgiVQ885PGKXE6ozOHUl7b58omrnfRG3S7O3Sw0MRHuCYXvsyi/rLkSadek8oXIy+wsfEZLAc14X4Zq2IquAp7dx8Yt3wAtq4tZtHDdU9hIsdS841Kf7YkngTA4BApn4DIoQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:20.9219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 524e9a06-88eb-4952-2a57-08d6eac149ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKufJ7AMSL4vfmlup2xNMXivefaLjQyttFAvInv7naU=;
 b=ijK/qpbWNhY0sql+uXc1jndhD6opNJicrj8ijSDswo6B8eQ9nNb0sWmXEDrrWr0FZqt9GdERbJMd/Juv/c6EjM8/4bMdy+xh9V8MGuvRsYqfj9h0ZoOmRzyB+RDyjkX7BGbhiRvjcSsQyNf5r6H+Do+ge/CTWKyCtVRpgwep1N8=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpIUEQgbm90IGdv
aW5nIHRvIGJlIGhpZ2ggaWYgUGFuZWwgVkREIGlzIG9mZgpBbmQgYWxsIEFVWCB0cmFuc2FjdGlv
biB3aWxsIGZhaWwgOigKCltIb3ddCjEuIFBvd2VyIG9uIFZERCBiZWZvcmUgYXR0ZW1wdGluZyBk
ZXRlY3Rpb24gaWYgaXQgaXNuJ3QgYWxyZWFkeSBvbgoyLiBJbXByb3ZlIHRoZSByb2J1c3RuZXNz
IGJ5IGhhdmluZyBhIHJldHJ5IG1lY2hhbmlzbSBvbiB0aGUKZmlyc3QgRFBDRCByZWFkIGFmdGVy
IFZERCBvbi4gSWYgYSBwYXJ0aWN1bGFyIGJvYXJkIGFsd2F5cyBob2xkcwpIUEQgaGlnaCBpbmNv
cnJlY3RseSwgdGhlIEFVWCBhY2Nlc3MgbWF5IGZhaWwsIHNvIHdlIGNhbiByZXRyeQppbiB0aG9z
ZSBzY2VuYXJpb3MuIFRoaXMgY2hhbmdlIHdvdWxkIG9ubHkgaW1wcm92ZSBsb2dpYwpzaW5jZSBp
dCBwcmV2ZW50cyBBVVggZmFpbHVyZSBsZWFkaW5nIHRvIGJhZCByZXNvbHV0aW9uIG9uIGludGVy
bmFsCnBhbmVsLgozLiBXZSBzaG91bGQgbmV2ZXIgbmVlZCB0byByZS1kZXRlY3QgaW50ZXJuYWwg
cGFuZWwsIHNvIGxvZ2ljCmlzIHJlLWFycmFuZ2VkIGEgYml0IHRvIHNraXAgZWFybGllci4KClNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIHwgNDIgKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwppbmRleCBjOWUwYjEyNjc3N2IuLmM1
ZGM4MDlmMTdkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYwpAQCAtMjE3LDggKzIxNywxMSBAQCBib29sIGRjX2xpbmtfZGV0ZWN0X3Npbmsoc3Ry
dWN0IGRjX2xpbmsgKmxpbmssIGVudW0gZGNfY29ubmVjdGlvbl90eXBlICp0eXBlKQogCQlyZXR1
cm4gdHJ1ZTsKIAl9CiAKLQlpZiAobGluay0+Y29ubmVjdG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQ
RV9FRFApCisJaWYgKGxpbmstPmNvbm5lY3Rvcl9zaWduYWwgPT0gU0lHTkFMX1RZUEVfRURQKSB7
CisJCS8qaW4gY2FzZSBpdCBpcyBub3Qgb24qLworCQlsaW5rLT5kYy0+aHdzcy5lZHBfcG93ZXJf
Y29udHJvbChsaW5rLCB0cnVlKTsKIAkJbGluay0+ZGMtPmh3c3MuZWRwX3dhaXRfZm9yX2hwZF9y
ZWFkeShsaW5rLCB0cnVlKTsKKwl9CiAKIAkvKiB0b2RvOiBtYXkgbmVlZCB0byBsb2NrIGdwaW8g
YWNjZXNzICovCiAJaHBkX3BpbiA9IGdldF9ocGRfZ3BpbyhsaW5rLT5jdHgtPmRjX2Jpb3MsIGxp
bmstPmxpbmtfaWQsIGxpbmstPmN0eC0+Z3Bpb19zZXJ2aWNlKTsKQEAgLTUyMCwxMSArNTIzLDMx
IEBAIHN0YXRpYyB2b2lkIHJlYWRfZWRwX2N1cnJlbnRfbGlua19zZXR0aW5nc19vbl9kZXRlY3Qo
c3RydWN0IGRjX2xpbmsgKmxpbmspCiAJdW5pb24gbGFuZV9jb3VudF9zZXQgbGFuZV9jb3VudF9z
ZXQgPSB7IHswfSB9OwogCXVpbnQ4X3QgbGlua19id19zZXQ7CiAJdWludDhfdCBsaW5rX3JhdGVf
c2V0OworCXVpbnQzMl90IHJlYWRfZHBjZF9yZXRyeV9jbnQgPSAxMDsKKwllbnVtIGRjX3N0YXR1
cyBzdGF0dXMgPSBEQ19FUlJPUl9VTkVYUEVDVEVEOworCWludCBpOwogCiAJLy8gUmVhZCBEUENE
IDAwMTAxaCB0byBmaW5kIG91dCB0aGUgbnVtYmVyIG9mIGxhbmVzIGN1cnJlbnRseSBzZXQKLQlj
b3JlX2xpbmtfcmVhZF9kcGNkKGxpbmssIERQX0xBTkVfQ09VTlRfU0VULAotCQkJJmxhbmVfY291
bnRfc2V0LnJhdywgc2l6ZW9mKGxhbmVfY291bnRfc2V0KSk7Ci0JbGluay0+Y3VyX2xpbmtfc2V0
dGluZ3MubGFuZV9jb3VudCA9IGxhbmVfY291bnRfc2V0LmJpdHMuTEFORV9DT1VOVF9TRVQ7CisJ
Zm9yIChpID0gMDsgaSA8IHJlYWRfZHBjZF9yZXRyeV9jbnQ7IGkrKykgeworCQlzdGF0dXMgPSBj
b3JlX2xpbmtfcmVhZF9kcGNkKAorCQkJCWxpbmssCisJCQkJRFBfTEFORV9DT1VOVF9TRVQsCisJ
CQkJJmxhbmVfY291bnRfc2V0LnJhdywKKwkJCQlzaXplb2YobGFuZV9jb3VudF9zZXQpKTsKKwkJ
LyogRmlyc3QgRFBDRCByZWFkIGFmdGVyIFZERCBPTiBjYW4gZmFpbCBpZiB0aGUgcGFydGljdWxh
ciBib2FyZAorCQkgKiBkb2VzIG5vdCBoYXZlIEhQRCBwaW4gd2lyZWQgY29ycmVjdGx5LiBTbyBp
ZiBEUENEIHJlYWQgZmFpbHMsCisJCSAqIHdoaWNoIGl0IHNob3VsZCBuZXZlciBoYXBwZW4sIHJl
dHJ5IGEgZmV3IHRpbWVzLiBUYXJnZXQgd29yc3QKKwkJICogY2FzZSBzY2VuYXJpbyBvZiA4MCBt
cy4KKwkJICovCisJCWlmIChzdGF0dXMgPT0gRENfT0spIHsKKwkJCWxpbmstPmN1cl9saW5rX3Nl
dHRpbmdzLmxhbmVfY291bnQgPSBsYW5lX2NvdW50X3NldC5iaXRzLkxBTkVfQ09VTlRfU0VUOwor
CQkJYnJlYWs7CisJCX0KKworCQl1ZGVsYXkoODAwMCk7CisJfQorCisJQVNTRVJUKHN0YXR1cyA9
PSBEQ19PSyk7CiAKIAkvLyBSZWFkIERQQ0QgMDAxMDBoIHRvIGZpbmQgaWYgc3RhbmRhcmQgbGlu
ayByYXRlcyBhcmUgc2V0CiAJY29yZV9saW5rX3JlYWRfZHBjZChsaW5rLCBEUF9MSU5LX0JXX1NF
VCwKQEAgLTY3OCw2ICs3MDEsMTEgQEAgYm9vbCBkY19saW5rX2RldGVjdChzdHJ1Y3QgZGNfbGlu
ayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikKIAlpZiAoZGNfaXNfdmlydHVh
bF9zaWduYWwobGluay0+Y29ubmVjdG9yX3NpZ25hbCkpCiAJCXJldHVybiBmYWxzZTsKIAorCWlm
ICgobGluay0+Y29ubmVjdG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9MVkRTIHx8CisJCQlsaW5r
LT5jb25uZWN0b3Jfc2lnbmFsID09IFNJR05BTF9UWVBFX0VEUCkgJiYKKwkJCWxpbmstPmxvY2Fs
X3NpbmspCisJCXJldHVybiB0cnVlOworCiAJaWYgKGZhbHNlID09IGRjX2xpbmtfZGV0ZWN0X3Np
bmsobGluaywgJm5ld19jb25uZWN0aW9uX3R5cGUpKSB7CiAJCUJSRUFLX1RPX0RFQlVHR0VSKCk7
CiAJCXJldHVybiBmYWxzZTsKQEAgLTY4OCwxNCArNzE2LDggQEAgYm9vbCBkY19saW5rX2RldGVj
dChzdHJ1Y3QgZGNfbGluayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikKIAkJ
ICogdXAgdG8gZGF0ZSwgZXNwZWNpYWxseSBpZiBsaW5rIHdhcyBwb3dlcmVkIG9uIGJ5IEdPUC4K
IAkJICovCiAJCXJlYWRfZWRwX2N1cnJlbnRfbGlua19zZXR0aW5nc19vbl9kZXRlY3QobGluayk7
Ci0JCWlmIChsaW5rLT5sb2NhbF9zaW5rKQotCQkJcmV0dXJuIHRydWU7CiAJfQogCi0JaWYgKGxp
bmstPmNvbm5lY3Rvcl9zaWduYWwgPT0gU0lHTkFMX1RZUEVfTFZEUyAmJgotCQkJbGluay0+bG9j
YWxfc2luaykKLQkJcmV0dXJuIHRydWU7Ci0KIAlwcmV2X3NpbmsgPSBsaW5rLT5sb2NhbF9zaW5r
OwogCWlmIChwcmV2X3NpbmsgIT0gTlVMTCkgewogCQlkY19zaW5rX3JldGFpbihwcmV2X3Npbmsp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
