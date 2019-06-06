Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7DD37F18
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF708931E;
	Thu,  6 Jun 2019 20:55:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869E9892B8
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:32 +0000 (UTC)
Received: from CY4PR12CA0033.namprd12.prod.outlook.com (2603:10b6:903:129::19)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Thu, 6 Jun
 2019 20:55:30 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by CY4PR12CA0033.outlook.office365.com
 (2603:10b6:903:129::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:30 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:12 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/24] drm/amd/display: Do not grant POST_LT_ADJ when TPS4 is
 used
Date: Thu, 6 Jun 2019 16:54:59 -0400
Message-ID: <20190606205501.16505-23-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(428003)(189003)(199004)(2351001)(68736007)(478600001)(16586007)(11346002)(476003)(2616005)(70586007)(72206003)(126002)(316002)(53416004)(305945005)(486006)(70206006)(446003)(26005)(186003)(36756003)(6916009)(47776003)(77096007)(336012)(48376002)(76176011)(7696005)(51416003)(4326008)(81156014)(53936002)(8676002)(426003)(8936002)(2906002)(81166006)(50226002)(86362001)(1076003)(14444005)(50466002)(356004)(6666004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a6979b3-cc07-4e11-05d7-08d6eac14f8a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1279E4B1FFA9BC22D0B1E660F9170@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KSXr9QDhw/kVmRIxi4RFgrV3tlpj0WV8Uhdfr9w9dToF9Q5oJF5PXqQl3BNMVwLt8dTcJ/M1SI6arKrzGpQog03fSwHnFMAapcPlv3DDXarvnPn7BDI0a597grtHAYj6IgD7h1Zt0a1AOjYffYgJ5XfrT/yrr8uhexjtWuD4tPi+3l4z8bFp8WIm/j12OioviIZ24mjw47hvUnWzOykQ/LZt0EOk3sG3+n5PZ1EiA/bczfXVfX+u2N2dw8PBDo7MIDXc0+001doXVNIdaYin9tnr7DwB2uXTKWG8LcXNC8yXuCBI1LNfChN60T5rmexnlbgSb4ceDcEQiQEkkFcE4kt0ANtOIFhdht7kG+GJEKDXPkg2VrsEqS8g1Ec1c1F/GDtdrS3KcEz37gTJ08iMf1py2mwSMRrC/LLXfwhHJls=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:30.2138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6979b3-cc07-4e11-05d7-08d6eac14f8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy1fpN+jFdKTUytnjIEKUpSss45YzmUIv2v5G5BwY/8=;
 b=NBbs5tTX6SpN4cJnSwF1K0nEU4RsHBo2AK+KuD0PUc+4rw0QIHnDPVhrLAjW6uSSC7U4TMedeTMH7CcTHRuBuMPbXXXLprhgCbnr1D3nxxAhVNPfT4GY990F6eJ4Hgp0YXJgpZTvgvNuX49lnTzSDwvlq5zt0OdKv9IYy9hcfmM=
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
Cc: abdoulaye berthe <abdoulaye.berthe@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogYWJkb3VsYXllIGJlcnRoZSA8YWJkb3VsYXllLmJlcnRoZUBhbWQuY29tPgoKW0Rlc2Ny
aXB0aW9uXQoKVGhlIHNwZWMgZG9lcyBub3QgYWxsb3cgUE9TVF9MVF9BREpfR1JBTlRFRCB0byBi
ZSBzZXQgd2hlbiBUUFM0IGlzIHVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBhYmRvdWxheWUgYmVydGhl
IDxhYmRvdWxheWUuYmVydGhlQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8
Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmtfZHAuYyAgfCA1NiArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4IDJkNTE5ZTVmYzNl
YS4uYTExODcyNzRkYmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGlua19kcC5jCkBAIC04OSw2ICs4OSwyOSBAQCBzdGF0aWMgdm9pZCBkcGNkX3Nl
dF90cmFpbmluZ19wYXR0ZXJuKAogCQlkcGNkX3BhdHRlcm4udjFfNC5UUkFJTklOR19QQVRURVJO
X1NFVCk7CiB9CiAKK3N0YXRpYyBlbnVtIGh3X2RwX3RyYWluaW5nX3BhdHRlcm4gZ2V0X3N1cHBv
cnRlZF90cChzdHJ1Y3QgZGNfbGluayAqbGluaykKK3sKKwllbnVtIGh3X2RwX3RyYWluaW5nX3Bh
dHRlcm4gaGlnaGVzdF90cCA9IEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fMjsKKwlzdHJ1Y3QgZW5j
b2Rlcl9mZWF0dXJlX3N1cHBvcnQgKmZlYXR1cmVzID0gJmxpbmstPmxpbmtfZW5jLT5mZWF0dXJl
czsKKwlzdHJ1Y3QgZHBjZF9jYXBzICpkcGNkX2NhcHMgPSAmbGluay0+ZHBjZF9jYXBzOworCisJ
aWYgKGZlYXR1cmVzLT5mbGFncy5iaXRzLklTX1RQUzNfQ0FQQUJMRSkKKwkJaGlnaGVzdF90cCA9
IEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fMzsKKworCWlmIChmZWF0dXJlcy0+ZmxhZ3MuYml0cy5J
U19UUFM0X0NBUEFCTEUpCisJCWhpZ2hlc3RfdHAgPSBIV19EUF9UUkFJTklOR19QQVRURVJOXzQ7
CisKKwlpZiAoZHBjZF9jYXBzLT5tYXhfZG93bl9zcHJlYWQuYml0cy5UUFM0X1NVUFBPUlRFRCAm
JgorCQloaWdoZXN0X3RwID49IEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fNCkKKwkJcmV0dXJuIEhX
X0RQX1RSQUlOSU5HX1BBVFRFUk5fNDsKKworCWlmIChkcGNkX2NhcHMtPm1heF9sbl9jb3VudC5i
aXRzLlRQUzNfU1VQUE9SVEVEICYmCisJCWhpZ2hlc3RfdHAgPj0gSFdfRFBfVFJBSU5JTkdfUEFU
VEVSTl8zKQorCQlyZXR1cm4gSFdfRFBfVFJBSU5JTkdfUEFUVEVSTl8zOworCisJcmV0dXJuIEhX
X0RQX1RSQUlOSU5HX1BBVFRFUk5fMjsKK30KKwogc3RhdGljIHZvaWQgZHBjZF9zZXRfbGlua19z
ZXR0aW5ncygKIAlzdHJ1Y3QgZGNfbGluayAqbGluaywKIAljb25zdCBzdHJ1Y3QgbGlua190cmFp
bmluZ19zZXR0aW5ncyAqbHRfc2V0dGluZ3MpCkBAIC05Nyw2ICsxMjAsNyBAQCBzdGF0aWMgdm9p
ZCBkcGNkX3NldF9saW5rX3NldHRpbmdzKAogCiAJdW5pb24gZG93bl9zcHJlYWRfY3RybCBkb3du
c3ByZWFkID0geyB7MH0gfTsKIAl1bmlvbiBsYW5lX2NvdW50X3NldCBsYW5lX2NvdW50X3NldCA9
IHsgezB9IH07CisJZW51bSBod19kcF90cmFpbmluZ19wYXR0ZXJuIGh3X3RyX3BhdHRlcm47CiAK
IAlkb3duc3ByZWFkLnJhdyA9ICh1aW50OF90KQogCShsdF9zZXR0aW5ncy0+bGlua19zZXR0aW5n
cy5saW5rX3NwcmVhZCk7CkBAIC0xMDYsOCArMTMwLDEzIEBAIHN0YXRpYyB2b2lkIGRwY2Rfc2V0
X2xpbmtfc2V0dGluZ3MoCiAKIAlsYW5lX2NvdW50X3NldC5iaXRzLkVOSEFOQ0VEX0ZSQU1JTkcg
PSAxOwogCi0JbGFuZV9jb3VudF9zZXQuYml0cy5QT1NUX0xUX0FESl9SRVFfR1JBTlRFRCA9Ci0J
CWxpbmstPmRwY2RfY2Fwcy5tYXhfbG5fY291bnQuYml0cy5QT1NUX0xUX0FESl9SRVFfU1VQUE9S
VEVEOworCWxhbmVfY291bnRfc2V0LmJpdHMuUE9TVF9MVF9BREpfUkVRX0dSQU5URUQgPSAwOwor
CisJaHdfdHJfcGF0dGVybiA9IGdldF9zdXBwb3J0ZWRfdHAobGluayk7CisJaWYgKGh3X3RyX3Bh
dHRlcm4gIT0gSFdfRFBfVFJBSU5JTkdfUEFUVEVSTl80KSB7CisJCWxhbmVfY291bnRfc2V0LmJp
dHMuUE9TVF9MVF9BREpfUkVRX0dSQU5URUQgPQorCQkJCWxpbmstPmRwY2RfY2Fwcy5tYXhfbG5f
Y291bnQuYml0cy5QT1NUX0xUX0FESl9SRVFfU1VQUE9SVEVEOworCX0KIAogCWNvcmVfbGlua193
cml0ZV9kcGNkKGxpbmssIERQX0RPV05TUFJFQURfQ1RSTCwKIAkmZG93bnNwcmVhZC5yYXcsIHNp
emVvZihkb3duc3ByZWFkKSk7CkBAIC02OTgsMjkgKzcyNyw2IEBAIHN0YXRpYyBib29sIHBlcmZv
cm1fcG9zdF9sdF9hZGpfcmVxX3NlcXVlbmNlKAogCiB9CiAKLXN0YXRpYyBlbnVtIGh3X2RwX3Ry
YWluaW5nX3BhdHRlcm4gZ2V0X3N1cHBvcnRlZF90cChzdHJ1Y3QgZGNfbGluayAqbGluaykKLXsK
LQllbnVtIGh3X2RwX3RyYWluaW5nX3BhdHRlcm4gaGlnaGVzdF90cCA9IEhXX0RQX1RSQUlOSU5H
X1BBVFRFUk5fMjsKLQlzdHJ1Y3QgZW5jb2Rlcl9mZWF0dXJlX3N1cHBvcnQgKmZlYXR1cmVzID0g
JmxpbmstPmxpbmtfZW5jLT5mZWF0dXJlczsKLQlzdHJ1Y3QgZHBjZF9jYXBzICpkcGNkX2NhcHMg
PSAmbGluay0+ZHBjZF9jYXBzOwotCi0JaWYgKGZlYXR1cmVzLT5mbGFncy5iaXRzLklTX1RQUzNf
Q0FQQUJMRSkKLQkJaGlnaGVzdF90cCA9IEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fMzsKLQotCWlm
IChmZWF0dXJlcy0+ZmxhZ3MuYml0cy5JU19UUFM0X0NBUEFCTEUpCi0JCWhpZ2hlc3RfdHAgPSBI
V19EUF9UUkFJTklOR19QQVRURVJOXzQ7Ci0KLQlpZiAoZHBjZF9jYXBzLT5tYXhfZG93bl9zcHJl
YWQuYml0cy5UUFM0X1NVUFBPUlRFRCAmJgotCQloaWdoZXN0X3RwID49IEhXX0RQX1RSQUlOSU5H
X1BBVFRFUk5fNCkKLQkJcmV0dXJuIEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fNDsKLQotCWlmIChk
cGNkX2NhcHMtPm1heF9sbl9jb3VudC5iaXRzLlRQUzNfU1VQUE9SVEVEICYmCi0JCWhpZ2hlc3Rf
dHAgPj0gSFdfRFBfVFJBSU5JTkdfUEFUVEVSTl8zKQotCQlyZXR1cm4gSFdfRFBfVFJBSU5JTkdf
UEFUVEVSTl8zOwotCi0JcmV0dXJuIEhXX0RQX1RSQUlOSU5HX1BBVFRFUk5fMjsKLX0KLQogc3Rh
dGljIGVudW0gbGlua190cmFpbmluZ19yZXN1bHQgZ2V0X2NyX2ZhaWx1cmUoZW51bSBkY19sYW5l
X2NvdW50IGxuX2NvdW50LAogCQkJCQl1bmlvbiBsYW5lX3N0YXR1cyAqZHBjZF9sYW5lX3N0YXR1
cykKIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
