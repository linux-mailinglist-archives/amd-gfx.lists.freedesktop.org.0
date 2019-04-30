Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8E1018A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD32289261;
	Tue, 30 Apr 2019 21:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3C28921D
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:47 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by MN2PR12MB3759.namprd12.prod.outlook.com (2603:10b6:208:163::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:09:46 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:46 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/20] drm/amd/display: Expose support for NV12 on suitable
 planes
Date: Tue, 30 Apr 2019 17:09:00 -0400
Message-ID: <20190430210938.32335-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(316002)(5660300002)(16586007)(26005)(86362001)(478600001)(76176011)(186003)(2351001)(51416003)(77096007)(72206003)(36756003)(53416004)(2616005)(47776003)(11346002)(81166006)(81156014)(426003)(446003)(48376002)(476003)(8676002)(8936002)(7696005)(126002)(50466002)(336012)(6916009)(2906002)(1076003)(305945005)(68736007)(70206006)(356004)(70586007)(6666004)(50226002)(53936002)(486006)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3759; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f2f360-5ecc-404e-2f31-08d6cdb02c6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3759; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3759:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3759D5C1C3EBBDBC3884523FF93A0@MN2PR12MB3759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2wpnQp+pG4Bt3iksRsPHOk0UldOHtzo7YxVP10CsylnstaSJwDW/zkyOHdnFDRqDzvL2sKZ37xQncHfDCixaEQp6unIsDnBJ3utzqqI/DEcD9QqSv73LO9MJVnKoWI8BQCPl0UiYwt90WsTaf7d6o70c79q3jsaBOxgSKtURwmZW4vblk5lH4mqBNRhp32+NQB3wqxFt36bI/Aka/GsrJvu/dsDRW5p5phSrkL3zD1YOtAqbQGNoUxC0nhKePxG48IgWVHeQYmnR1YTXThUYRJXi3ZOAI6ZU7Y7PLX9xQI1E0wU3hjSfgzyo5uV7B2er2QSGR9Udlu3ysTGc5mcVjnuXC/LxSoiJhGE9liSqIpQ83agYYXNW7wepmfXqOs1ta/sjO9cTNn8Cki0ewd9fl5BVGPvlGAokhj/jv/15JX4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:46.0858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f2f360-5ecc-404e-2f31-08d6cdb02c6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iqym6VOtnVXrhlo7ZeMFEqNjXvIKJ3EIw+P0rPfCkM=;
 b=s3ONS2Z/crOVrMbwa8sQJKfF7q20XsCcfzIvk/V6QeXOo4kVot/5FtbjDKKrJx3hjN++XFw6i1DjRrzZVlNmSywg/85V8kEx5p+FhZUBJzOubEIyt1XdG6prDlcYoaoiVewWTaZR3z3v9FvzsvaJu4VCO9ShaHChcLBvb4OkLX8=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KSGFyZHdhcmUgY2FuIHN1cHBvcnQgdmlkZW8gc3VyZmFjZXMgYW5kIERDIHRlbGxzIHVz
IHdoaWNoIHBsYW5lcyBhcmUKc3VpdGFibGUgdmlhIERDIHBsYW5lIGNhcHMuCgpbSG93XQpUaGUg
c3VwcG9ydGVkIGZvcm1hdHMgYXJyYXkgd2lsbCBub3cgdmFyeSBiYXNlZCBvbiB3aGF0IERDIHRl
bGxzIHVzLApzbyBjcmVhdGUgYW4gYXJyYXkgYW5kIGZpbGwgaXQgZHluYW1pY2FsbHkgYmFzZWQg
b24gcGxhbmUgdHlwZXMgYW5kCmNhcHMuCgpJZGVhbGx5IHdlJ2QgcXVlcnkgc3VwcG9ydCBmb3Ig
ZXZlcnkgZm9ybWF0IHZpYSBEQyBwbGFuZSBjYXBzLCBidXQgZm9yCnRoZSBmcmFtZXdvcmsgaXMg
aW4gcGxhY2UgdG8gZG8gc28gbGF0ZXIgd2l0aCB0aGlzLgoKQ2hhbmdlLUlkOiBJYzgwZjEyZDNm
N2U5NWZjMzMyMTlmOTBlOTUyMTk0NjhmMDQ0YWM2ZApTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBL
YXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBTdW4g
cGVuZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgODYgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDUxMTM0Njc1
MDM5MC4uNmU5MjIwOTlmNjE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQyMDcsNDYgKzQyMDcsNzEgQEAgc3RhdGljIGNv
bnN0IHUzMiBjdXJzb3JfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfQVJHQjg4ODgKIH07CiAK
LXN0YXRpYyBpbnQgYW1kZ3B1X2RtX3BsYW5lX2luaXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgKmRtLAotCQkJCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAotCQkJCXVuc2lnbmVkIGxv
bmcgcG9zc2libGVfY3J0Y3MsCi0JCQkJY29uc3Qgc3RydWN0IGRjX3BsYW5lX2NhcCAqcGxhbmVf
Y2FwKQorc3RhdGljIGludCBnZXRfcGxhbmVfZm9ybWF0cyhjb25zdCBzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwKKwkJCSAgICAgY29uc3Qgc3RydWN0IGRjX3BsYW5lX2NhcCAqcGxhbmVfY2FwLAor
CQkJICAgICB1aW50MzJfdCAqZm9ybWF0cywgaW50IG1heF9mb3JtYXRzKQogewotCWludCByZXMg
PSAtRVBFUk07CisJaW50IGksIG51bV9mb3JtYXRzID0gMDsKKworCS8qCisJICogVE9ETzogUXVl
cnkgc3VwcG9ydCBmb3IgZWFjaCBncm91cCBvZiBmb3JtYXRzIGRpcmVjdGx5IGZyb20KKwkgKiBE
QyBwbGFuZSBjYXBzLiBUaGlzIHdpbGwgcmVxdWlyZSBhZGRpbmcgbW9yZSBmb3JtYXRzIHRvIHRo
ZQorCSAqIGNhcHMgbGlzdC4KKwkgKi8KIAogCXN3aXRjaCAocGxhbmUtPnR5cGUpIHsKIAljYXNl
IERSTV9QTEFORV9UWVBFX1BSSU1BUlk6Ci0JCXJlcyA9IGRybV91bml2ZXJzYWxfcGxhbmVfaW5p
dCgKLQkJCQlkbS0+YWRldi0+ZGRldiwKLQkJCQlwbGFuZSwKLQkJCQlwb3NzaWJsZV9jcnRjcywK
LQkJCQkmZG1fcGxhbmVfZnVuY3MsCi0JCQkJcmdiX2Zvcm1hdHMsCi0JCQkJQVJSQVlfU0laRShy
Z2JfZm9ybWF0cyksCi0JCQkJTlVMTCwgcGxhbmUtPnR5cGUsIE5VTEwpOworCQlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRShyZ2JfZm9ybWF0cyk7ICsraSkgeworCQkJaWYgKG51bV9mb3JtYXRz
ID49IG1heF9mb3JtYXRzKQorCQkJCWJyZWFrOworCisJCQlmb3JtYXRzW251bV9mb3JtYXRzKytd
ID0gcmdiX2Zvcm1hdHNbaV07CisJCX0KKworCQlpZiAocGxhbmVfY2FwICYmIHBsYW5lX2NhcC0+
c3VwcG9ydHNfbnYxMikKKwkJCWZvcm1hdHNbbnVtX2Zvcm1hdHMrK10gPSBEUk1fRk9STUFUX05W
MTI7CiAJCWJyZWFrOworCiAJY2FzZSBEUk1fUExBTkVfVFlQRV9PVkVSTEFZOgotCQlyZXMgPSBk
cm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoCi0JCQkJZG0tPmFkZXYtPmRkZXYsCi0JCQkJcGxhbmUs
Ci0JCQkJcG9zc2libGVfY3J0Y3MsCi0JCQkJJmRtX3BsYW5lX2Z1bmNzLAotCQkJCW92ZXJsYXlf
Zm9ybWF0cywKLQkJCQlBUlJBWV9TSVpFKG92ZXJsYXlfZm9ybWF0cyksCi0JCQkJTlVMTCwgcGxh
bmUtPnR5cGUsIE5VTEwpOworCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShvdmVybGF5X2Zv
cm1hdHMpOyArK2kpIHsKKwkJCWlmIChudW1fZm9ybWF0cyA+PSBtYXhfZm9ybWF0cykKKwkJCQli
cmVhazsKKworCQkJZm9ybWF0c1tudW1fZm9ybWF0cysrXSA9IG92ZXJsYXlfZm9ybWF0c1tpXTsK
KwkJfQogCQlicmVhazsKKwogCWNhc2UgRFJNX1BMQU5FX1RZUEVfQ1VSU09SOgotCQlyZXMgPSBk
cm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoCi0JCQkJZG0tPmFkZXYtPmRkZXYsCi0JCQkJcGxhbmUs
Ci0JCQkJcG9zc2libGVfY3J0Y3MsCi0JCQkJJmRtX3BsYW5lX2Z1bmNzLAotCQkJCWN1cnNvcl9m
b3JtYXRzLAotCQkJCUFSUkFZX1NJWkUoY3Vyc29yX2Zvcm1hdHMpLAotCQkJCU5VTEwsIHBsYW5l
LT50eXBlLCBOVUxMKTsKKwkJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY3Vyc29yX2Zvcm1h
dHMpOyArK2kpIHsKKwkJCWlmIChudW1fZm9ybWF0cyA+PSBtYXhfZm9ybWF0cykKKwkJCQlicmVh
azsKKworCQkJZm9ybWF0c1tudW1fZm9ybWF0cysrXSA9IGN1cnNvcl9mb3JtYXRzW2ldOworCQl9
CiAJCWJyZWFrOwogCX0KIAorCXJldHVybiBudW1fZm9ybWF0czsKK30KKworc3RhdGljIGludCBh
bWRncHVfZG1fcGxhbmVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCisJ
CQkJc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCisJCQkJdW5zaWduZWQgbG9uZyBwb3NzaWJsZV9j
cnRjcywKKwkJCQljb25zdCBzdHJ1Y3QgZGNfcGxhbmVfY2FwICpwbGFuZV9jYXApCit7CisJdWlu
dDMyX3QgZm9ybWF0c1szMl07CisJaW50IG51bV9mb3JtYXRzOworCWludCByZXMgPSAtRVBFUk07
CisKKwludW1fZm9ybWF0cyA9IGdldF9wbGFuZV9mb3JtYXRzKHBsYW5lLCBwbGFuZV9jYXAsIGZv
cm1hdHMsCisJCQkJCUFSUkFZX1NJWkUoZm9ybWF0cykpOworCisJcmVzID0gZHJtX3VuaXZlcnNh
bF9wbGFuZV9pbml0KGRtLT5hZGV2LT5kZGV2LCBwbGFuZSwgcG9zc2libGVfY3J0Y3MsCisJCQkJ
ICAgICAgICZkbV9wbGFuZV9mdW5jcywgZm9ybWF0cywgbnVtX2Zvcm1hdHMsCisJCQkJICAgICAg
IE5VTEwsIHBsYW5lLT50eXBlLCBOVUxMKTsKKwlpZiAocmVzKQorCQlyZXR1cm4gcmVzOworCiAJ
aWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX09WRVJMQVkgJiYKIAkgICAgcGxhbmVf
Y2FwICYmIHBsYW5lX2NhcC0+cGVyX3BpeGVsX2FscGhhKSB7CiAJCXVuc2lnbmVkIGludCBibGVu
ZF9jYXBzID0gQklUKERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpIHwKQEAgLTQyNjIsOCArNDI4
Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX3BsYW5lX2luaXQoc3RydWN0IGFtZGdwdV9kaXNw
bGF5X21hbmFnZXIgKmRtLAogCWlmIChwbGFuZS0+ZnVuY3MtPnJlc2V0KQogCQlwbGFuZS0+ZnVu
Y3MtPnJlc2V0KHBsYW5lKTsKIAotCi0JcmV0dXJuIHJlczsKKwlyZXR1cm4gMDsKIH0KIAogc3Rh
dGljIGludCBhbWRncHVfZG1fY3J0Y19pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2Vy
ICpkbSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
