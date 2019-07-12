Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2466A8A
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810A6E33B;
	Fri, 12 Jul 2019 09:59:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BE26E33B
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:59:51 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3678.namprd12.prod.outlook.com (10.255.86.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 09:59:49 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 09:59:49 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay: add helper of smu_clk_dpm_is_enabled
 for smu
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVOJiKtJuf6b+uRkmnGadDPCnbPQ==
Date: Fri, 12 Jul 2019 09:59:49 +0000
Message-ID: <20190712095930.16268-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::12) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52a83402-c129-428c-df43-08d706afad24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3678; 
x-ms-traffictypediagnostic: MN2PR12MB3678:
x-microsoft-antispam-prvs: <MN2PR12MB3678FA385F68D867476657BAA2F20@MN2PR12MB3678.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(189003)(199004)(52116002)(36756003)(99286004)(6486002)(86362001)(6916009)(2616005)(14444005)(54906003)(2501003)(81166006)(71190400001)(8936002)(71200400001)(256004)(2906002)(476003)(81156014)(316002)(53936002)(486006)(5640700003)(186003)(8676002)(14454004)(50226002)(102836004)(6506007)(66446008)(64756008)(6512007)(66556008)(3846002)(66476007)(2351001)(5660300002)(305945005)(66066001)(26005)(478600001)(68736007)(4326008)(6116002)(1076003)(66946007)(6436002)(7736002)(386003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3678;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9GlKHVn2cqYt+ld/QNSDzC+UopcUGYvC8R8SHTt39rlh9gpzHr4MrwYEvHUkr1gjn44uzzE/BUq0hT4Ia0iinxZXRKuGpvSZbMIxOZgj17RVMl7+HVYEMrZeGZ7m5wucGYmcx/0hTQ/tmdf2yk9AV56FepRIn/aDMN+60guKH5vER6z1NNgPWcvHZZapxrE1WF6o4kWU8PIKCAT2AxHvm0ZgG4KiPyWCK58MdnTbjxUEb7izp2TUq32cwwpX48RfIkjNzhnEwJtHRwhKPKLPFGNwYl+6dVK5mvdPYZ1ZKx1zA1JkWH7+UKn9zJMnp5yCriw+Wv8F2blyuqmDCzxz+4/NZqPvkkeFJyL3k5QQwqL5Hek4HCbGArru14DL9+YHSeBlvB422O86S4mjtqk5b1FmmWIC1nWoxZCDPxlBgx0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a83402-c129-428c-df43-08d706afad24
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:59:49.2331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4Ocvj7CsZuATb19IDVqi4V2MYwvfOXsjsVQSqoMv/s=;
 b=heZDVKSbxzicJhwkzxXHhpjCCoDhuqh6/JN3tfG3MlDSGqiPIsp4zHP3CKikWZx+P0yCqInzbM87etRVNnX7GnQt+qkBB8RKldkh5rpr9VzD1NfO7qbWDaRg9z/8Je7FwYarLH8g/u9Q8Y5/8D6GNX5x9Z0Hm2xL+MGbBSlfw8U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6IGNoYW5nZSBmdW5jdGlvbiBuYW1lIHRvIHNtdV9jbGtfZHBtX2lzX2VuYWJsZWQuCmFkZCB0
aGlzIGhlbHBlciBmdW5jdGlvbiB0byBjaGVjayBkcG0gY2xrIGZlYXR1cmUgaXMgZW5hYmxlZC4K
CkNoYW5nZS1JZDogSTdmOTk0OTAzM2MzMThmZWM2MThhOTcwMWRmNGEwODJkNTRhNjI2YzgKU2ln
bmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCA2OSArKysrKysrKysrKyst
LS0tLS0tCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA3ODdhMjkz
ZmRlOTcuLmMxNjE5NWUxOTA3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwpAQCAtNjksNiArNjksMTAgQEAgaW50IHNtdV9zZXRfc29mdF9mcmVxX3Jhbmdl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKIAlp
ZiAobWluIDw9IDAgJiYgbWF4IDw9IDApCiAJCXJldHVybiAtRUlOVkFMOwogCisJcmV0ID0gc211
X2Nsa19kcG1faXNfZW5hYmxlZChzbXUsIGNsa190eXBlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4g
cmV0OworCiAJY2xrX2lkID0gc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7CiAJaWYg
KGNsa19pZCA8IDApCiAJCXJldHVybiBjbGtfaWQ7CkBAIC0xMDIsNiArMTA2LDEwIEBAIGludCBz
bXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVf
Y2xrX3R5cGUgY2xrX3R5cGUsCiAJaWYgKG1pbiA8PSAwICYmIG1heCA8PSAwKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAorCXJldCA9IHNtdV9jbGtfZHBtX2lzX2VuYWJsZWQoc211LCBjbGtfdHlwZSk7
CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4
KHNtdSwgY2xrX3R5cGUpOwogCWlmIChjbGtfaWQgPCAwKQogCQlyZXR1cm4gY2xrX2lkOwpAQCAt
MTM1LDI5ICsxNDMsOSBAQCBpbnQgc211X2dldF9kcG1fZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCiAJaWYgKCFtaW4gJiYgIW1h
eCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlzd2l0Y2ggKGNsa190eXBlKSB7Ci0JY2FzZSBTTVVf
TUNMSzoKLQljYXNlIFNNVV9VQ0xLOgotCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211
LCBTTVVfRkVBVFVSRV9EUE1fVUNMS19CSVQpKSB7Ci0JCQlwcl93YXJuKCJ1Y2xrIGRwbSBpcyBu
b3QgZW5hYmxlZFxuIik7Ci0JCQlyZXR1cm4gMDsKLQkJfQotCQlicmVhazsKLQljYXNlIFNNVV9H
RlhDTEs6Ci0JY2FzZSBTTVVfU0NMSzoKLQkJaWYgKCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNt
dSwgU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQpKSB7Ci0JCQlwcl93YXJuKCJnZnhjbGsgZHBt
IGlzIG5vdCBlbmFibGVkXG4iKTsKLQkJCXJldHVybiAwOwotCQl9Ci0JY2FzZSBTTVVfU09DQ0xL
OgotCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fU09D
Q0xLX0JJVCkpIHsKLQkJCXByX3dhcm4oInNvY2tjbGsgZHBtIGlzIG5vdCBlbmFibGVkXG4iKTsK
LQkJCXJldHVybiAwOwotCQl9Ci0JCWJyZWFrOwotCWRlZmF1bHQ6Ci0JCWJyZWFrOwotCX0KKwly
ZXQgPSBzbXVfY2xrX2RwbV9pc19lbmFibGVkKHNtdSwgY2xrX3R5cGUpOworCWlmIChyZXQpCisJ
CXJldHVybiByZXQ7CiAKIAltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsKIAljbGtfaWQgPSBzbXVf
Y2xrX2dldF9pbmRleChzbXUsIGNsa190eXBlKTsKQEAgLTIwMCw2ICsxODgsMTAgQEAgaW50IHNt
dV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211
X2Nsa190eXBlIGNsa190eXAKIAlpZiAoIXZhbHVlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCXJl
dCA9IHNtdV9jbGtfZHBtX2lzX2VuYWJsZWQoc211LCBjbGtfdHlwZSk7CisJaWYgKHJldCkKKwkJ
cmV0dXJuIHJldDsKKwogCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUp
OwogCWlmIChjbGtfaWQgPCAwKQogCQlyZXR1cm4gY2xrX2lkOwpAQCAtMjI4LDYgKzIyMCwzNyBA
QCBpbnQgc211X2dldF9kcG1fbGV2ZWxfY291bnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCXJldHVybiBzbXVfZ2V0X2RwbV9mcmVxX2J5X2lu
ZGV4KHNtdSwgY2xrX3R5cGUsIDB4ZmYsIHZhbHVlKTsKIH0KIAoraW50IHNtdV9jbGtfZHBtX2lz
X2VuYWJsZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190
eXBlKQoreworCWludCByZXQgPSAwOworCWVudW0gc211X2ZlYXR1cmVfbWFzayBmZWF0dXJlX2lk
ID0gMDsKKworCXN3aXRjaCAoY2xrX3R5cGUpIHsKKwljYXNlIFNNVV9NQ0xLOgorCWNhc2UgU01V
X1VDTEs6CisJCWZlYXR1cmVfaWQgPSBTTVVfRkVBVFVSRV9EUE1fVUNMS19CSVQ7CisJCWJyZWFr
OworCWNhc2UgU01VX0dGWENMSzoKKwljYXNlIFNNVV9TQ0xLOgorCQlmZWF0dXJlX2lkID0gU01V
X0ZFQVRVUkVfRFBNX0dGWENMS19CSVQ7CisJCWJyZWFrOworCWNhc2UgU01VX1NPQ0NMSzoKKwkJ
ZmVhdHVyZV9pZCA9ICBTTVVfRkVBVFVSRV9EUE1fU09DQ0xLX0JJVDsKKwkJYnJlYWs7CisJZGVm
YXVsdDoKKwkJcmV0dXJuIDA7CisJfQorCisJcmV0ID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChz
bXUsIGZlYXR1cmVfaWQpOworCWlmIChyZXQpIHsKKwkJcHJfd2Fybigic211ICVkIGNsayBkcG0g
ZmVhdHVyZSAlZCBpcyBub3QgZW5hYmxlZFxuIiwgY2xrX3R5cGUsIGZlYXR1cmVfaWQpOworCQly
ZXR1cm4gLUVBQ0NFUzsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCisKIGludCBzbXVfZHBtX3Nl
dF9wb3dlcl9nYXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBibG9ja190eXBl
LAogCQkJICAgYm9vbCBnYXRlKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKaW5kZXggYzk3MzI0ZWY3ZGIyLi40NjI5YTY0YTkwZWQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtOTcz
LDUgKzk3Myw2IEBAIGludCBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCiBlbnVtIGFtZF9kcG1fZm9yY2Vk
X2xldmVsIHNtdV9nZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
OwogaW50IHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCk7CiBpbnQgc211X3NldF9kaXNwbGF5
X2NvdW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBjb3VudCk7CitpbnQgc211
X2Nsa19kcG1faXNfZW5hYmxlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xr
X3R5cGUgY2xrX3R5cGUpOwogCiAjZW5kaWYKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
