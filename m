Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DC7153B
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E1589950;
	Tue, 23 Jul 2019 09:31:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E3A89950
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwvWlutSGaazc3EXuLFnRHB8d10HOJSzm7vPxpPMeeHSoRyXRFuPvkuDy5keT4F4nhQSt9BAcdlyMxP16QM2FYVaOVlensmBSG72APqVIjtgp6/lbnXu9E9bOHETj+e3/xIcEHjevsOu3VVOk0F+HmfI/HQbpu4B+akkbAK4sJeJo5hIrI1eBkTwKzxWL/7cQM9EUyovCD3uletOWFNbmWgnCSTmMBdLsVslSJNkXNo+6KM7i1Z//+xhDRPKB9/yGpiAJ5Hy3y8+juM5YNAgE5pEyxMnWVDX/jsFtnvC61u7zzOKdZQbQHUT22PVJ39y1Vwj0Q5babvoVDiZeotGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4Ocvj7CsZuATb19IDVqi4V2MYwvfOXsjsVQSqoMv/s=;
 b=eQBgri0Wy6B4uhaBF3zLLHP4ok14QYBySOKgUgeVnW6VP2X2YXGq2vmcf+tb4wPabEg1Uuajy5eESTAJUcMV8/s+Bv2wyU53ge0u7yN1NQP+vfDNu7ALekpXkn3qQ33uWl16WK4X5SIxEHryj+WmBIuZxJJ9uANoLPtBtjRODtvt6kxY9JNOYHHUks/pcxyhthEEZDKhoPmRiQbtEBKpUqcd3JQVck9Gl6+fMToZ1CgylBHf8TiR737Wi/Kasm2HAgzqXj7tWc6zUQbJlyYnOusFDudBfunOiXqQL6RJDDs/9w2jlcZCSH25z5x5ICy1rv41+XXH95TejRSPWpRunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 09:31:49 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 09:31:49 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay: add helper of smu_clk_dpm_is_enabled
 for smu
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVQTl03T3OlCIbBkSYA5pvlrIGHg==
Date: Tue, 23 Jul 2019 09:31:49 +0000
Message-ID: <20190723093109.2701-2-kevin1.wang@amd.com>
References: <20190723093109.2701-1-kevin1.wang@amd.com>
In-Reply-To: <20190723093109.2701-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5326c9f7-ea95-4e26-9296-08d70f5096a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-microsoft-antispam-prvs: <MN2PR12MB322944ED04BA8BC35E777DD1A2C70@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(2501003)(478600001)(5640700003)(2351001)(25786009)(6486002)(14454004)(6436002)(6916009)(53936002)(6512007)(66066001)(26005)(66476007)(476003)(86362001)(66556008)(64756008)(66446008)(66946007)(5660300002)(102836004)(386003)(2906002)(7736002)(8936002)(81156014)(81166006)(316002)(8676002)(4326008)(36756003)(76176011)(71200400001)(71190400001)(305945005)(50226002)(6116002)(1076003)(14444005)(256004)(3846002)(68736007)(6506007)(54906003)(52116002)(446003)(11346002)(186003)(2616005)(99286004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DDiF5SlqMtgUiU/EJIAaXr0GCvDTEwoxqR4Qio5Ydam+bJxMkJSJEh2pDv0Hr9pgBP3UqNyD1h0o8FFW28LYW5rSLTa/olVeI51DNEMw7gVnaZdU2wObeKhJ8Nyus9lN3pHBl6L/s2MIxuzY0l8oy+8QjBjTVTMjQSIWTOZBX2zlOjuDWoL9eBkNLwFTPiEzM79frYtmfJV0rK5HCDM/zfJuM4gGuc5UVeaY6w4gwbK4qPl9njSFB+dZoVnAK5gPF8N72JIw0BgLcMb91R88uGmqFoVENCw2T8+dRXR/BSKJB+3m4vSexacRzjnTFB/TBO8iRqdDou9KekLVpi8FibSuJqLkzsLIOL58QaLXL1VNl/D+X7/oXpBh9DhsLW0mbaa+hjDk5GwY30mxYlM+wAu0ORBctF80/mFFT0E/UH8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5326c9f7-ea95-4e26-9296-08d70f5096a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:31:49.7589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4Ocvj7CsZuATb19IDVqi4V2MYwvfOXsjsVQSqoMv/s=;
 b=usLck0MrqZCtz015/35WbWOH1V4jyMMnQs6fnQDtX5lgDwSpF7KWp/ZdDu0Aqm/XSYKKfhoJ3eIzjV/EHHudWoVRaYlUZUilLD0FsODm+O4oRvGcxVJd2xHPjx6fk0qB+y0gEI7xmbEB8y3836lYyf6j3GDz3yBvVAJczExiq3o=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
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
