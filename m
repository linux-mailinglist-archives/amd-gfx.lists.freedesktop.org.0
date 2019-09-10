Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21895AE294
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 05:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0489E69;
	Tue, 10 Sep 2019 03:40:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680080.outbound.protection.outlook.com [40.107.68.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF7789E69
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 03:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASaALKVdtc8jT8iHUlN0u57wUvkg0q3ymn5reZWbMFMZbkBDv62otx8ND8fviLouEmIQq9DtDeWQYPQMBXWBrAX//2xW4topRCVtOKnwx/1W9ocUnSWsY+UqQhDO5/ZsHtYMWhZ9KftAYi69VbBhYVs+b+8CAQYcoP1bLCiT/hVQ53ygCCFdwcQtYz3sREscTBrZiWGPSuwKDpttlW/80lUovZTMAoFOaZG2sGDBCHoRXxJxbpbBfnC0heXcEpi70SemvnVoSNQBQFzOrpq52iW2T0dIPETynzQU4cb7ayjrwM/5O6SbPjWiMohrTCek2kMn9a7JSTPX/RqJ/QRWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6BsvXfVQwL2uleJsuicNM7sxn4qLVe6m+pFkSaB68Y=;
 b=cRwVMJ4Pdm0eif/hIxZvyqISxxEikrdox47YZJ4FVPokn9rB+IpfYBSP7TLQw2OjOWIf/yV5JtFn7ReelbBF3q8+4SHGEuvg4uR1b6zcuDzH+5EiILfGPSCxrR144q4rnmnrvdFWN0maYjTVTV2w8WgMm0A9VgpB+3OEaf6fC7wNqs+Uht7F+mhiU18FiEZtdtN1PIyoAE1hcLyTabSg+AN1cp19qejbbOZswmyzUPXO0vskJ5AZ/KtTgF6gvHf1VsV9oHRq5BIbWa3KcHEA8p1Aut+RUZ8JFQBp6m/5LBOy4bb5qlK+tOfZP+drLN2aM5EE0fUXKPYiboAfIV+0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2605.namprd12.prod.outlook.com (52.135.102.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 03:40:42 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::eca8:92f5:cd16:fbc2]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::eca8:92f5:cd16:fbc2%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 03:40:41 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
 (v2)
Thread-Topic: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
 (v2)
Thread-Index: AQHVZ4clHNs+ojPyvEKrtj4JjUcWUqckQ4fQ
Date: Tue, 10 Sep 2019 03:40:41 +0000
Message-ID: <SN6PR12MB2813411E5ADB0125AD12423DF1B60@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <1568085803-2202-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1568085803-2202-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee3bc9b-24d0-4c8c-02a9-08d735a0a7a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2605; 
x-ms-traffictypediagnostic: SN6PR12MB2605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB260556CCD4C85BD5B5BB0D8AF1B60@SN6PR12MB2605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:339;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(13464003)(189003)(199004)(6636002)(11346002)(76116006)(446003)(476003)(2501003)(110136005)(66476007)(316002)(66556008)(478600001)(71190400001)(71200400001)(66446008)(6246003)(486006)(8676002)(74316002)(64756008)(229853002)(66946007)(81156014)(305945005)(7736002)(81166006)(9686003)(86362001)(6116002)(3846002)(7696005)(53936002)(55016002)(14454004)(8936002)(76176011)(6506007)(53546011)(25786009)(102836004)(6436002)(66066001)(5660300002)(256004)(14444005)(99286004)(186003)(52536014)(26005)(33656002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2605;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cvUbhYxFxg2pSl28TCcCqIBowu2jPE+Y+2ol9ml+3nn+tQ4EJ22hzwu40QYNnyBvniAWspICQ3yLE4spcVdhJDerZHlRocZymsvSdTb9gs9pA/O7rNVp/eXs7T5wNdrAehPMKZZcT+UhuhLMG6XJNA8VHTzl4hUcoB1JePlUh9LxpfA6P3C6XbY09aO3Nd2OLOW2k11PjdsqO65rRr86p46B0bGG+T3BnqGyocq6F9Pk9uOVZd39sf95UhTeuYE6K7Uh6vxr5TEgudB0FhKp4yRrbIwswC0UPQgaZOQP1HPkZeprwS4bDeR7RkaYeIVI8BQloqr1VkpKcIAuGzXd/y1rm1oQ+cNOt4/Rx2hgcdyva/QRUrEx2WNRF9HJkLDq9MXmFhQ6x4wrPlQp58q58WYrrdRbM4Af/TCWQQBf2EY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee3bc9b-24d0-4c8c-02a9-08d735a0a7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 03:40:41.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1H4Kkp3avLtjBzSOQx7KqIaKaUmLEEKhpP0eFWIjV/2ckucnypftvx1j/zZ+cx40g84+1Gz5Q9ErYASAXzByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6BsvXfVQwL2uleJsuicNM7sxn4qLVe6m+pFkSaB68Y=;
 b=D3FkQysW/U5rKTNzCInLgNYzqtF8Hz1kX87W5/JkZvr/Bg0i5F7/xzNclgdPlJ2PN43nxjVYtLgEP2UgeyNT1bQsKl/u4BzRIvyCJlt7JiIRyxmLM7HyYHKdQPc3rt+qSSD0T79JnFyaMXbSzgcJLNO1S2X7XiO87tGW4U98SJg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaGFuZywgSGF3a2luZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPiAKU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAyMDE5IDExOjI0
IEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hlbiwgR3VjaHVuIDxHdWNo
dW4uQ2hlbkBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBMaSwgRGVu
bmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT4KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6IGluaXRpYWxpemUgcmFzIHN0cnVjdHVy
ZXMgZm9yIHhnbWkgYmxvY2sgKHYyKQoKaW5pdCByYXMgY29tbW9uIGludGVyZmFjZSBhbmQgZnMg
bm9kZSBmb3IgeGdtaSBibG9jawoKdjI6IHJlbW92ZSB1bm5lY2VzYXJ5IHBoeXNpY2FsIG5vZGUg
bnVtYmVyIGNoZWNrIGJlZm9yZSBpbnZva2luZyBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0CltH
dWNodW5dQSB0eXBvLCBzL3VubmVjZXNhcnkvdW5uZWNlc3NhcnkuIFdpdGggdGhhdCBmaXhlZCwg
c2VyaWVzIGlzOiBSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+
CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oICB8ICAxICsgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgfCAzNiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWku
aCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgfCAgNCAr
KystCiA0IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKaW5kZXggMjMyYThmZi4uOGM4NTQ3
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaApAQCAtMTIzLDYgKzEy
Myw3IEBAIHN0cnVjdCBhbWRncHVfeGdtaSB7CiAJLyogZ3B1IGxpc3QgaW4gdGhlIHNhbWUgaGl2
ZSAqLwogCXN0cnVjdCBsaXN0X2hlYWQgaGVhZDsKIAlib29sIHN1cHBvcnRlZDsKKwlzdHJ1Y3Qg
cmFzX2NvbW1vbl9pZiAqcmFzX2lmOwogfTsKIAogc3RydWN0IGFtZGdwdV9nbWMgewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKaW5kZXggNjVhYWU3NS4uN2Y2ZjJlOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jCkBAIC0yNSw2ICsyNSw3
IEBACiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3hnbWkuaCIKICNpbmNs
dWRlICJhbWRncHVfc211LmgiCisjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIgogI2luY2x1ZGUgImRm
L2RmXzNfNl9vZmZzZXQuaCIKIAogc3RhdGljIERFRklORV9NVVRFWCh4Z21pX211dGV4KTsKQEAg
LTQzNywzICs0MzgsMzggQEAgdm9pZCBhbWRncHVfeGdtaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQltdXRleF91bmxvY2soJmhpdmUtPmhpdmVfbG9jayk7CiAJ
fQogfQorCitpbnQgYW1kZ3B1X3hnbWlfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikgeworCWludCByOworCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbyA9IHsKKwkJLmNi
ID0gTlVMTCwKKwl9OworCXN0cnVjdCByYXNfZnNfaWYgZnNfaW5mbyA9IHsKKwkJLnN5c2ZzX25h
bWUgPSAieGdtaV93YWZsX2Vycl9jb3VudCIsCisJCS5kZWJ1Z2ZzX25hbWUgPSAieGdtaV93YWZs
X2Vycl9pbmplY3QiLAorCX07CisKKwlpZiAoIWFkZXYtPmdtYy54Z21pLnN1cHBvcnRlZCB8fAor
CSAgICBhZGV2LT5nbWMueGdtaS5udW1fcGh5c2ljYWxfbm9kZXMgPT0gMCkKKwkJcmV0dXJuIDA7
CisKKwlpZiAoIWFkZXYtPmdtYy54Z21pLnJhc19pZikgeworCQlhZGV2LT5nbWMueGdtaS5yYXNf
aWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOwor
CQlpZiAoIWFkZXYtPmdtYy54Z21pLnJhc19pZikKKwkJCXJldHVybiAtRU5PTUVNOworCQlhZGV2
LT5nbWMueGdtaS5yYXNfaWYtPmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fWEdNSV9XQUZMOwor
CQlhZGV2LT5nbWMueGdtaS5yYXNfaWYtPnR5cGUgPSBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9V
TkNPUlJFQ1RBQkxFOworCQlhZGV2LT5nbWMueGdtaS5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9
IDA7CisJCXN0cmNweShhZGV2LT5nbWMueGdtaS5yYXNfaWYtPm5hbWUsICJ4Z21pX3dhZmwiKTsK
Kwl9CisJaWhfaW5mby5oZWFkID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPmdtYy54Z21pLnJhc19p
ZjsKKwlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+Z21jLnhnbWkucmFzX2lm
LAorCQkJCSAmZnNfaW5mbywgJmloX2luZm8pOworCWlmIChyIHx8ICFhbWRncHVfcmFzX2lzX3N1
cHBvcnRlZChhZGV2LCBhZGV2LT5nbWMueGdtaS5yYXNfaWYtPmJsb2NrKSkgeworCQlrZnJlZShh
ZGV2LT5nbWMueGdtaS5yYXNfaWYpOworCQlhZGV2LT5nbWMueGdtaS5yYXNfaWYgPSBOVUxMOwor
CX0KKworCXJldHVybiByOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3hnbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21p
LmgKaW5kZXggZmJjZWUzMS4uOTAyMzc4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3hnbWkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGdtaS5oCkBAIC00Miw2ICs0Miw3IEBAIHZvaWQgYW1kZ3B1X3hnbWlfcmVtb3ZlX2Rl
dmljZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7ICBpbnQgYW1kZ3B1X3hnbWlfc2V0X3Bz
dGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHBzdGF0ZSk7ICBpbnQgYW1kZ3B1
X3hnbWlfZ2V0X2hvcHNfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXN0cnVj
dCBhbWRncHVfZGV2aWNlICpwZWVyX2FkZXYpOworaW50IGFtZGdwdV94Z21pX3Jhc19sYXRlX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCiBzdGF0aWMgaW5saW5lIGJvb2wgYW1k
Z3B1X3hnbWlfc2FtZV9oaXZlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYm9fYWRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
CmluZGV4IDBkMDZjNzkuLjRiMTA2OTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYwpAQCAtNTEsNiArNTEsNyBAQAogI2luY2x1ZGUgIml2c3JjaWQvdm1jL2lycXNyY3Nfdm1j
XzFfMC5oIgogCiAjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIgorI2luY2x1ZGUgImFtZGdwdV94Z21p
LmgiCiAKIC8qIGFkZCB0aGVzZSBoZXJlIHNpbmNlIHdlIGFscmVhZHkgaW5jbHVkZSBkY2UxMiBo
ZWFkZXJzIGFuZCB0aGVzZSBhcmUgZm9yIERDTiAqLwogI2RlZmluZSBtbUhVQlAwX0RDU1VSRl9Q
UklfVklFV1BPUlRfRElNRU5TSU9OICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDU1ZApAQCAtODAyLDcgKzgwMyw4IEBAIHN0YXRpYyBp
bnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJCWlmIChyKQogCQkJcmV0
dXJuIHI7CiAJfQotCXJldHVybiAwOworCisJcmV0dXJuIGFtZGdwdV94Z21pX3Jhc19sYXRlX2lu
aXQoYWRldik7CiB9CiAKIHN0YXRpYyBpbnQgZ21jX3Y5XzBfbGF0ZV9pbml0KHZvaWQgKmhhbmRs
ZSkKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
