Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FADDCCEB
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846C6E13F;
	Fri, 18 Oct 2019 17:36:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47FB6E13F
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VspyLYdqqQ/C8PI3erIJozfEirbd17aVUxNFk2HtyE4YOwO6NetRppfGuu1F8vg46d3LiFH0jdPp7uHuiZBfKVimhUJI8RBB7dzoL+zU7GuvZN/seBhHRGKUmripVAKNr0+G9ENHX1Y9PC8cznImbPuL7ivSwAFluGihGx/56b0MMDf+gYG3NUUkhiJ8Yv9zNFo84jD0jYk63kkYKCqmHo6ar8sZUT1aPmbpzm1V9zINtU6Cn0j5g2Yncm8yMhO+J6j22BvL0rdHqmO3N5WrYa3fT6LLbpa7AkGBx27E3+UGunYcVWTIoUEgpJiaeimCwH7O46tE8tIIGQK2RgkbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBNDOL0PWEovEGNbwBxbJvzhke4Vu2dWvFmUzxPiPVY=;
 b=FTmnH8Vc8wrwXgimbZm3BmjYJ++cLDX4TJ8SdoW5KD2Qs7ClzUVmuAH7yMNMUycv6F9IYFcUHsieUaLW8TNjoAq5uJgbygbkLqYXuLJwHqaCsOWsFWRwoz4SuKeFChn0wy5BZTdJPfP74QoEKR0UNjR6JFjZB4FFxgLM5EGXGacmCN5HsQomxBO6nY9KyvX5Zz9Enf55TOfXggpZtjuvXqW+BY5pU92Py6/mnuCkDpKbizyx9bBsliLN+tlHLdEtJjwwP7BZ1EisBonf54XGiKcro145Fgpy3uvQQqx71MoVTAtQXZwimFWlbA2ivjkHMtMOwxQwmGDp/GauWBOd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 17:36:27 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 17:36:27 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdkfd: kfd open return failed if device is locked
Thread-Topic: [PATCH v2] drm/amdkfd: kfd open return failed if device is locked
Thread-Index: AQHVhdqRBjWwBKIu5kCdDNOtcOl22w==
Date: Fri, 18 Oct 2019 17:36:27 +0000
Message-ID: <20191018173614.9758-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 340298de-178a-4320-17e6-08d753f1b40d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2863052794710E6B6FB5FCF4E66C0@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(199004)(189003)(5640700003)(66476007)(6436002)(7736002)(99286004)(66446008)(102836004)(66946007)(66556008)(6512007)(6506007)(64756008)(305945005)(5660300002)(1076003)(52116002)(25786009)(26005)(2351001)(386003)(186003)(8676002)(81166006)(8936002)(81156014)(256004)(14444005)(6486002)(50226002)(4326008)(71190400001)(486006)(316002)(71200400001)(14454004)(66066001)(476003)(86362001)(36756003)(2616005)(478600001)(6116002)(3846002)(2906002)(6916009)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeWZnmElxLoRB5dF8iJSi4K4MQXCHaOsWmpsRRlh9a0U+boW1wzmJCq0bJQM7dNotUeNK4Fg4c2N9So2fX5p3ELO8SKgME+MDhEnne8r5dKCtsukRQkyB73xp2bVwVtnxMdmehfW9uEU/G+Yyimnp6Iv7a6v2Zw7UqQ/3j4KgF1iXS452Te/tYlj2nA8FtaliSkTbGy75YEVUzPyhigcjpBuMSDeTDaSoMSk9bkfZoxT885WDU3RbQvs3xD+KF7+kTNZUsOmUfYLmpu7AoDat5azL4JFtYy7N2n9HFiSa5JW8lruW6FmSFDRy1kmjmg/uBJaaVM4Cb8o/DFFviQvEnx/3/ouIFu255fkVIuaHLkugGVsQQ0+UiOrNKKfxlf455Lf7Fbix2QL4/mmMpc08ONltisgUToBEDxRaLx5mbs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340298de-178a-4320-17e6-08d753f1b40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:36:27.2003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leulmpRfEsOCjnKozVgrPrnkQB8jLsVRxTN3aVBZj+MDOXI3wQwKTnTUtDuG5H7z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBNDOL0PWEovEGNbwBxbJvzhke4Vu2dWvFmUzxPiPVY=;
 b=YumgJmrsd2GSrfry+3D7NCHf7HBbOkeWofjw24/lKeKB0QuHNqRQb3lte7dE7FHR95YzxHH6F2q0vq/UAFD6uCRoayqTKzET/qVG8S77AEhNvEzb4979Al3yInp1DMjYqNnLIuajho2DDFjXI1CUt0T1wuliZn0z+iEuatX2Bvc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgZGV2aWNlIGlzIGxvY2tlZCBmb3Igc3VzcGVuZCBhbmQgcmVzdW1lLCBrZmQgb3BlbiBzaG91
bGQgcmV0dXJuCmZhaWxlZCAtRUFHQUlOIHdpdGhvdXQgY3JlYXRpbmcgcHJvY2Vzcywgb3RoZXJ3
aXNlIHRoZSBhcHBsaWNhdGlvbiBleGl0CnRvIHJlbGVhc2UgdGhlIHByb2Nlc3Mgd2lsbCBoYW5n
IHRvIHdhaXQgZm9yIHJlc3VtZSBpcyBkb25lIGlmIHRoZSBzdXNwZW5kCmFuZCByZXN1bWUgaXMg
c3R1Y2sgc29tZXdoZXJlLiBUaGlzIGlzIGJhY2t0cmFjZToKCnYyOiBmaXggcHJvY2Vzc2VzIHRo
YXQgd2VyZSBjcmVhdGVkIGJlZm9yZSBzdXNwZW5kL3Jlc3VtZSBnb3Qgc3R1Y2sKCltUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldIElORk86IHRhc2sgcm9jbWluZm86MzAyNCBibG9ja2VkIGZvciBt
b3JlCnRoYW4gMTIwIHNlY29uZHMuCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICAgICAgIE5v
dCB0YWludGVkCjUuMC4wLXJjMS1rZmQtY29tcHV0ZS1yb2NtLWRrbXMtbm8tbnBpLTExMzEgIzEK
W1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gImVjaG8gMCA+Ci9wcm9jL3N5cy9rZXJuZWwvaHVu
Z190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdlLgpbVGh1IE9jdCAxNyAx
Njo0MzozNyAyMDE5XSByb2NtaW5mbyAgICAgICAgRCAgICAwICAzMDI0ICAgMjk0NwoweDgwMDAw
MDAwCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldIENhbGwgVHJhY2U6CltUaHUgT2N0IDE3IDE2
OjQzOjM3IDIwMTldICA/IF9fc2NoZWR1bGUrMHgzZDkvMHg4YTAKW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIHNjaGVkdWxlKzB4MzIvMHg3MApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAg
c2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZCsweGEvMHgxMApbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgX19tdXRleF9sb2NrLmlzcmEuOSsweDFlMy8weDRlMApbVGh1IE9jdCAxNyAxNjo0Mzoz
NyAyMDE5XSAgPyBfX2NhbGxfc3JjdSsweDI2NC8weDNiMApbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgPyBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKzB4MjQvMHgyZjAKW2FtZGdwdV0KW1Ro
dSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIHByb2Nlc3NfdGVybWluYXRpb25fY3BzY2grMHgyNC8w
eDJmMApbYW1kZ3B1XQpbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XQprZmRfcHJvY2Vzc19kZXF1
ZXVlX2Zyb21fYWxsX2RldmljZXMrMHg0Mi8weDYwIFthbWRncHVdCltUaHUgT2N0IDE3IDE2OjQz
OjM3IDIwMTldICBrZmRfcHJvY2Vzc19ub3RpZmllcl9yZWxlYXNlKzB4MWJlLzB4MjIwClthbWRn
cHVdCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBfX21tdV9ub3RpZmllcl9yZWxlYXNlKzB4
M2UvMHhjMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZXhpdF9tbWFwKzB4MTYwLzB4MWEw
CltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IF9faGFuZGxlX21tX2ZhdWx0KzB4YmEzLzB4
MTIwMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBleGl0X3JvYnVzdF9saXN0KzB4NWEv
MHgxMTAKW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIG1tcHV0KzB4NGEvMHgxMjAKW1RodSBP
Y3QgMTcgMTY6NDM6MzcgMjAxOV0gIGRvX2V4aXQrMHgyODQvMHhiMjAKW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gID8gaGFuZGxlX21tX2ZhdWx0KzB4ZmEvMHgyMDAKW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gIGRvX2dyb3VwX2V4aXQrMHgzYS8weGEwCltUaHUgT2N0IDE3IDE2OjQzOjM3
IDIwMTldICBfX3g2NF9zeXNfZXhpdF9ncm91cCsweDE0LzB4MjAKW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIGRvX3N5c2NhbGxfNjQrMHg0Zi8weDEwMApbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQoKU2lnbmVkLW9m
Zi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyAgICAgICAgICAgICAgIHwgNiArKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyB8IDYg
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwppbmRleCBkOWUzNmRiZjEz
ZDUuLjQwZDc1YzM5ZjA4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NoYXJkZXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jCkBAIC0xMjAsMTMgKzEyMCwxMyBAQCBzdGF0aWMgaW50IGtmZF9vcGVuKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKIAkJcmV0dXJuIC1FUEVSTTsKIAl9CiAKKwlp
ZiAoa2ZkX2lzX2xvY2tlZCgpKQorCQlyZXR1cm4gLUVBR0FJTjsKKwogCXByb2Nlc3MgPSBrZmRf
Y3JlYXRlX3Byb2Nlc3MoZmlsZXApOwogCWlmIChJU19FUlIocHJvY2VzcykpCiAJCXJldHVybiBQ
VFJfRVJSKHByb2Nlc3MpOwogCi0JaWYgKGtmZF9pc19sb2NrZWQoKSkKLQkJcmV0dXJuIC1FQUdB
SU47Ci0KIAlkZXZfZGJnKGtmZF9kZXZpY2UsICJwcm9jZXNzICVkIG9wZW5lZCwgY29tcGF0IG1v
ZGUgKDMyIGJpdCkgLSAlZFxuIiwKIAkJcHJvY2Vzcy0+cGFzaWQsIHByb2Nlc3MtPmlzXzMyYml0
X3VzZXJfbW9kZSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYwppbmRleCA4NTA5ODE0YTZmZjAuLjM3ODQwMTNiOTJh
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVl
dWVfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNz
X3F1ZXVlX21hbmFnZXIuYwpAQCAtMTI4LDYgKzEyOCwxMiBAQCB2b2lkIGtmZF9wcm9jZXNzX2Rl
cXVldWVfZnJvbV9hbGxfZGV2aWNlcyhzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnApCiB7CiAJc3RydWN0
IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOwogCisJLyogSWYgc3VzcGVuZC9yZXN1bWUgZ290IHN0
dWNrLCBkcW1fbG9jayBpcyBob2xkLAorCSAqIHNraXAgcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNj
aCB0byBhdm9pZCBkZWFkbG9jaworCSAqLworCWlmIChrZmRfaXNfbG9ja2VkKCkpCisJCXJldHVy
bjsKKwogCWxpc3RfZm9yX2VhY2hfZW50cnkocGRkLCAmcC0+cGVyX2RldmljZV9kYXRhLCBwZXJf
ZGV2aWNlX2xpc3QpCiAJCWtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9kZXZpY2UocGRkKTsKIH0K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
