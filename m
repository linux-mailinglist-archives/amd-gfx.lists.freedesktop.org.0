Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3216CAAB
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6D16E34A;
	Thu, 18 Jul 2019 08:11:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AF76E34A
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i29TEtI6EdEdPOHt5ScHiLNwRa3tgJ1MQfQihQ2SQM2q7RJkMkkjCcnaL9rNISgsxqTKsOUrVcEi9+kWDOZ6SVtMef/uvc6UM2HS4MKJFkro2fTziPE53V9w7f3XF3jopSbdtPQPCI6QxN2+bowuWCzlpZRI5kS76vXcCxPRs3nH6nmwBEoH7J1PGafsAG7DevJDTLAARHGhkYSimdq5+9UDDxZ4rIw+WfvV0yYJctI3D6K0QKov1cgqlVk0iqIZE17M+xdYK5rtacdvTyR0F3pXCtjQr4w7Qaefo/bLafdl4QrF3wvlVQ2xEhWAdGoGlK3B7DKgESxMsup8x0t6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJBpNUQz8FfNdMX3Lo+o9ZcYPrSUB4o8tnC5vGC/UUY=;
 b=SW39Xyfv5D/5+NiibEX7NGwkegyg2MrxeE+L34XXG4AYTCMzMT2fJhPRy3IDfcaNqKWYOZZWU1aboiVsrq1QcbAV9aLoY7bXXTzfME+qogOOCcKiemdXam6bSSr810UP/gUTTPLZ7zKIQrqUxeSfLhJfnpTSSzKRxWseNH2UvHmI8B51RJPRXwldyrK3uA22y/ZaXWXYbqVBWba8t1U22wS3gE4uZmxqoWZQJao664q9OMii9+r6yuKy7nQJ1OtTH4aMPTozcLzgueCUbw1PZwU0FYmCj11Yq3e+fWYQzqRT9MWVd+P/NdtmEqzA40wNMtTkZUYHlxy6i30uziFmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB2912.namprd12.prod.outlook.com (20.179.81.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 08:11:01 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 08:11:01 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 2/2] tests/amdgpu: add gpu reset test
Thread-Topic: [PATCH libdrm 2/2] tests/amdgpu: add gpu reset test
Thread-Index: AQHVPUBWQqEHJu4WVEWXlSJoLMcaBg==
Date: Thu, 18 Jul 2019 08:11:01 +0000
Message-ID: <1563437433-4157-2-git-send-email-flora.cui@amd.com>
References: <1563437433-4157-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1563437433-4157-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2298de3a-f0cd-4258-eb17-08d70b57787d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2912; 
x-ms-traffictypediagnostic: MN2PR12MB2912:
x-microsoft-antispam-prvs: <MN2PR12MB2912BB6D9D5C9618FF69CCE3FAC80@MN2PR12MB2912.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(199004)(189003)(486006)(446003)(186003)(26005)(71190400001)(81156014)(25786009)(8676002)(11346002)(52116002)(8936002)(102836004)(2906002)(71200400001)(476003)(6916009)(76176011)(256004)(2616005)(316002)(68736007)(81166006)(386003)(14444005)(64756008)(66446008)(66476007)(4326008)(66556008)(86362001)(66946007)(66066001)(7736002)(6506007)(2501003)(5660300002)(14454004)(2351001)(53936002)(6512007)(6486002)(36756003)(3846002)(305945005)(5640700003)(50226002)(478600001)(6436002)(6116002)(99286004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2912;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hkc/tTuinjTR1tuhsUWV8mSnuglejiiCBr5KIhj7nbQpAxhei/1++AzEUH8kw0JhWu2V5grSDbTn70yDAP7F1YCODmviUSX1iTlMHLxbr50riQoLrdCZy2En/VyqpjBCUS89QD9FXcEOVgjghHxTrXeHkMoQvVaXc3n2oCQqLZFWMntPPyL2MbaxBf8otyl67jbzvoej3/Wn4Fi9S5GIwJMJ4pczGCoLMyP8l0cpUboXp0DuOE5byjSTD7bxVl6AfDbsU45x7VsF9bcZH8a/RFFfUVSe+zMThCW3zrBB6tDQxPy78jDoa1YqIFwIRGBjADeotcDpt/XixHm4CELpXP7o6+zCRZ7XUdqdBKonDhZNGrq4FsJ5CwktwWf29NqG79aT6dRI+Mz1hGkHApcxTvFHpPAGQ4aAoTCF+W5e07c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2298de3a-f0cd-4258-eb17-08d70b57787d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:11:01.2769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2912
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJBpNUQz8FfNdMX3Lo+o9ZcYPrSUB4o8tnC5vGC/UUY=;
 b=Qtvwo93cNedHXNw7paFqSj/As0qzMqH5/QBEAvOY2SMuQJ9MiYdd+pTPE7U5vXODIELjlut8D7uSduyHd9bnZ7F/Uw/nRGStJG0SFYNHAotdkgvjrP99WP6qafxDTdcfWVTyk/iBNarOg/P2Rmhtb/5hfjsorljVSGXN7tSGmEI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS4gcGVyZm9ybSBncHUgcmVzZXQKMi4gcGVyZm9ybSBkaXNwYXRjaCB0ZXN0IHRvIHZlcmlmeSBn
cHUgcmVzZXQgdG8gYSBnb29kIHN0YXRlCgpDaGFuZ2UtSWQ6IEk0YmJhMGQxYjgyOTI4OGJiYTdi
Njg4NWQ3ZTY4YzhmNjllZjhmNGI1ClNpZ25lZC1vZmYtYnk6IEZsb3JhIEN1aSA8ZmxvcmEuY3Vp
QGFtZC5jb20+Ci0tLQogdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMgfCAgNSArKysrKwogdGVz
dHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMgYi90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3Qu
YwppbmRleCA3MzQwM2ZiLi4wYzkzNjRhIDEwMDY0NAotLS0gYS90ZXN0cy9hbWRncHUvYW1kZ3B1
X3Rlc3QuYworKysgYi90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYwpAQCAtNDcyLDYgKzQ3Miwx
MSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZGlzYWJsZV9zdWl0ZXMoKQogCWlmIChmYW1pbHlfaWQg
PCBBTURHUFVfRkFNSUxZX0FJIHx8IGZhbWlseV9pZCA+IEFNREdQVV9GQU1JTFlfUlYpCiAJCWlm
IChhbWRncHVfc2V0X3Rlc3RfYWN0aXZlKEJBU0lDX1RFU1RTX1NUUiwgIkRyYXcgVGVzdCIsIENV
X0ZBTFNFKSkKIAkJCWZwcmludGYoc3RkZXJyLCAidGVzdCBkZWFjdGl2YXRpb24gZmFpbGVkIC0g
JXNcbiIsIENVX2dldF9lcnJvcl9tc2coKSk7CisKKwkvKiBUaGlzIHRlc3Qgd2FzIHJhbiBvbiBH
Rlg5IG9ubHkgKi8KKwlpZiAoZmFtaWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlf
aWQgPiBBTURHUFVfRkFNSUxZX1JWKQorCQlpZiAoYW1kZ3B1X3NldF90ZXN0X2FjdGl2ZShCQVNJ
Q19URVNUU19TVFIsICJHUFUgcmVzZXQgVGVzdCIsIENVX0ZBTFNFKSkKKwkJCWZwcmludGYoc3Rk
ZXJyLCAidGVzdCBkZWFjdGl2YXRpb24gZmFpbGVkIC0gJXNcbiIsIENVX2dldF9lcnJvcl9tc2co
KSk7CiB9CiAKIC8qIFRoZSBtYWluKCkgZnVuY3Rpb24gZm9yIHNldHRpbmcgdXAgYW5kIHJ1bm5p
bmcgdGhlIHRlc3RzLgpkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgYi90
ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYwppbmRleCA4ZmE3MDg4Li5jMDRkZjhiIDEwMDY0NAot
LS0gYS90ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYworKysgYi90ZXN0cy9hbWRncHUvYmFzaWNf
dGVzdHMuYwpAQCAtMjQsNiArMjQsOSBAQAogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8
c3RkbGliLmg+CiAjaW5jbHVkZSA8dW5pc3RkLmg+CisjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cisj
aW5jbHVkZSA8c3lzL3N0YXQuaD4KKyNpbmNsdWRlIDxmY250bC5oPgogI2lmZGVmIEhBVkVfQUxM
T0NBX0gKICMgaW5jbHVkZSA8YWxsb2NhLmg+CiAjZW5kaWYKQEAgLTUxLDYgKzU0LDcgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X3N5bmNfZGVwZW5kZW5jeV90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQg
YW1kZ3B1X2JvX2V2aWN0aW9uX3Rlc3Qodm9pZCk7CiBzdGF0aWMgdm9pZCBhbWRncHVfZGlzcGF0
Y2hfdGVzdCh2b2lkKTsKIHN0YXRpYyB2b2lkIGFtZGdwdV9kcmF3X3Rlc3Qodm9pZCk7CitzdGF0
aWMgdm9pZCBhbWRncHVfZ3B1X3Jlc2V0X3Rlc3Qodm9pZCk7CiAKIHN0YXRpYyB2b2lkIGFtZGdw
dV9jb21tYW5kX3N1Ym1pc3Npb25fd3JpdGVfbGluZWFyX2hlbHBlcih1bnNpZ25lZCBpcF90eXBl
KTsKIHN0YXRpYyB2b2lkIGFtZGdwdV9jb21tYW5kX3N1Ym1pc3Npb25fY29uc3RfZmlsbF9oZWxw
ZXIodW5zaWduZWQgaXBfdHlwZSk7CkBAIC03NCw2ICs3OCw3IEBAIENVX1Rlc3RJbmZvIGJhc2lj
X3Rlc3RzW10gPSB7CiAJeyAiU3luYyBkZXBlbmRlbmN5IFRlc3QiLCAgYW1kZ3B1X3N5bmNfZGVw
ZW5kZW5jeV90ZXN0IH0sCiAJeyAiRGlzcGF0Y2ggVGVzdCIsICBhbWRncHVfZGlzcGF0Y2hfdGVz
dCB9LAogCXsgIkRyYXcgVGVzdCIsICBhbWRncHVfZHJhd190ZXN0IH0sCisJeyAiR1BVIHJlc2V0
IFRlc3QiLCBhbWRncHVfZ3B1X3Jlc2V0X3Rlc3QgfSwKIAlDVV9URVNUX0lORk9fTlVMTCwKIH07
CiAjZGVmaW5lIEJVRkZFUl9TSVpFICg4ICogMTAyNCkKQEAgLTMxMzEsMyArMzEzNiwzNiBAQCBz
dGF0aWMgdm9pZCBhbWRncHVfZHJhd190ZXN0KHZvaWQpCiAJCWFtZGdwdV9tZW1jcHlfZHJhd190
ZXN0KGRldmljZV9oYW5kbGUsIHJpbmdfaWQpOwogCX0KIH0KKworc3RhdGljIHZvaWQgYW1kZ3B1
X2dwdV9yZXNldF90ZXN0KHZvaWQpCit7CisJaW50IHI7CisJY2hhciBkZWJ1Z2ZzX3BhdGhbMjU2
XSwgdG1wWzEwXTsKKwlpbnQgZmQ7CisJc3RydWN0IHN0YXQgc2J1ZjsKKwlhbWRncHVfY29udGV4
dF9oYW5kbGUgY29udGV4dF9oYW5kbGU7CisJdWludDMyX3QgaGFuZ19zdGF0ZSwgaGFuZ3M7CisK
KwlyID0gYW1kZ3B1X2NzX2N0eF9jcmVhdGUoZGV2aWNlX2hhbmRsZSwgJmNvbnRleHRfaGFuZGxl
KTsKKwlDVV9BU1NFUlRfRVFVQUwociwgMCk7CisKKwlyID0gZnN0YXQoZHJtX2FtZGdwdVswXSwg
JnNidWYpOworCUNVX0FTU0VSVF9FUVVBTChyLCAwKTsKKworCXNwcmludGYoZGVidWdmc19wYXRo
LCAiL3N5cy9rZXJuZWwvZGVidWcvZHJpLyVkL2FtZGdwdV9ncHVfcmVjb3ZlciIsIG1pbm9yKHNi
dWYuc3RfcmRldikpOworCWZkID0gb3BlbihkZWJ1Z2ZzX3BhdGgsIE9fUkRPTkxZKTsKKwlDVV9B
U1NFUlQoZmQgPj0gMCk7CisKKwlyID0gcmVhZChmZCwgdG1wLCBzaXplb2YodG1wKS9zaXplb2Yo
Y2hhcikpOworCUNVX0FTU0VSVChyID4gMCk7CisKKwlyID0gYW1kZ3B1X2NzX3F1ZXJ5X3Jlc2V0
X3N0YXRlKGNvbnRleHRfaGFuZGxlLCAmaGFuZ19zdGF0ZSwgJmhhbmdzKTsKKwlDVV9BU1NFUlRf
RVFVQUwociwgMCk7CisJQ1VfQVNTRVJUX0VRVUFMKGhhbmdfc3RhdGUsIEFNREdQVV9DVFhfVU5L
Tk9XTl9SRVNFVCk7CisKKwljbG9zZShmZCk7CisJciA9IGFtZGdwdV9jc19jdHhfZnJlZShjb250
ZXh0X2hhbmRsZSk7CisJQ1VfQVNTRVJUX0VRVUFMKHIsIDApOworCisJYW1kZ3B1X2Rpc3BhdGNo
X3Rlc3QoKTsKK30KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
