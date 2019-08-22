Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EF989B1
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 05:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF66EA58;
	Thu, 22 Aug 2019 03:00:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110676EA58
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 03:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Di7P+CgGHH1B7w5av4G0nyuCSLTY0bgOZUNEZaVUk2B/E5bbWjwAqP52u6s1PY92JbzonnlukUTDLeIW5HKqHGa4H8wCn9AtJxSmaHICIElOqNGu7NK+cv7MhLTR3zLN0W/wKMacI8Fln/RnkHqtJuVIljVWWsjlxvfdSpY4hkwVlGGqeIZMDninXD4wJK67qkbLtuRUnPkAgBHJi836omSsDDtJqXmFK99w4AIrQbZQwtouGUrzKGoNzvujrCE4/qN9Mgypozd5bTQVYzgySd9YTof8BqMeLm6qoob26hhX9y4f6f065VNCEHRC+fLSIEAcOqOlRmypifmhGLWl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PurlSsOOJ2HeY9ogVfnPlBo9KT70H5ldHYNjbEbI0fY=;
 b=L0xzSuYlkk8v/bCybIyKsvNQh2lqGHYhwHt13u8wAeMZ/yQHAVdd5eFdZjXWuWw7B8m2l7O2J9K85qSfHwiyR86EmsCh5D6CH+wpUzF2CkSYVFE3NwrH8uN62eLzN8eYAhsUl50FhZHINJlFhMfMhNZpPsXUigvh3RmM4I44WmUYaDIgCSfHiX1m5BivGbI1eTCL/ZJUrSAR6pG/CH2WXHWcl1UBb6zuvzIgDHn8U5CGjfRgpDm6+wB7+7Jmtf/gqGHQqAf/Ppp43Uff+H0p+z4fovP8Bsk23h6n9mbFjeLOUzIEeXvfvq/jodYYdRIfPOBRMCt/9aDYPMABeO/hVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2849.namprd12.prod.outlook.com (20.179.67.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 03:00:35 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 03:00:35 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: add dummy read for some GCVM status registers
Thread-Topic: [PATCH] drm/amdgpu: add dummy read for some GCVM status registers
Thread-Index: AQHVWJXEbtDhZIgohkqjAv0ABRVx3g==
Date: Thu, 22 Aug 2019 03:00:35 +0000
Message-ID: <20190822030020.13635-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772767a4-3ef9-4b6d-822c-08d726ace737
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB2849; 
x-ms-traffictypediagnostic: BN8PR12MB2849:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB2849E55A9C51FFCED43B793989A50@BN8PR12MB2849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(366004)(376002)(396003)(346002)(189003)(199004)(25786009)(486006)(6116002)(8936002)(66476007)(6436002)(5660300002)(86362001)(66556008)(66946007)(316002)(6486002)(476003)(66446008)(3846002)(71200400001)(386003)(8676002)(54906003)(53936002)(7736002)(2906002)(66066001)(2616005)(6916009)(5640700003)(2351001)(6512007)(256004)(186003)(81166006)(14444005)(478600001)(4326008)(52116002)(26005)(2501003)(6506007)(99286004)(14454004)(71190400001)(102836004)(81156014)(64756008)(36756003)(1076003)(50226002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2849;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6g0dWN8oBGDpsBDN6dQLVYJ68p20mKLGfZ/4XnqCF1RVV/OtyD0vxfSlqjzWRjCipdRa8ZnvgJiY6lkdSsYLPAe7OmV55PtdB6EDUzmLutJ4r3MqZVuGMIgTnNI8kXUTQyMorauKJPzM8n0RZslvIFcEjSpQ7EvBDRMta6SexkJg/GQ5rphX22q2Py3+f7pTxkdt0jCPyxOXmPyNyyqwYfLiWmM9E0G5aVbBnp5nAJYiJMWYk5EJwTxU18gzaINJu52O7A6Pt+G6YUpLJd4wk/41JVUerpHuAhMyAjhNBK/A4v1hIeMJ9a3h0gzyMlXCmFrhs6SMtYr3bgH+uaXFxHAN1MZ2X9mZN6bzwut3f+WsWJ41zHCLph39OdNHy5Tsd5rIOaNzXxDwNRV1IPX6TzooAX9SZxBGXU2J7m14Qig=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772767a4-3ef9-4b6d-822c-08d726ace737
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 03:00:35.3858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GGZTp3OnewpIPj4ufSPRYU5tyOjWmLEg1mc25oyvIGZvRTpI+qd9N9c+1M0A5ue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PurlSsOOJ2HeY9ogVfnPlBo9KT70H5ldHYNjbEbI0fY=;
 b=FKrVrFJnFDmxpdhCwa4+yYFHtraRYSGyoxSh1lNnT7tPJ0Y7OXM/fx8x53oaT612HYSvDTNUTJ1EUJkXKN4uI+Fd/SoVUR77Sw6p6RSBmFEIMvVKsNgF9nW/Px9ELr2rEoduhti5vKnEnczyq/jFR+/EBJezxCYQw0ipgdCR+9M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEdSQk0gcmVnaXN0ZXIgaW50ZXJmYWNlIGlzIG5vdyBjYXBhYmxlIG9mIGJ1cnN0aW5nIDEg
Y3ljbGUgcGVyCnJlZ2lzdGVyIHdyLT53ciwgd3ItPnJkIG11Y2ggZmFzdGVyIHRoYW4gcHJldmlv
dXMgbXV0aWN5Y2xlIHBlcgp0cmFuc2FjdGlvbiBkb25lIGludGVyZmFjZS4gIFRoaXMgaGFzIGNh
dXNlZCBhIHByb2JsZW0gd2hlcmUgc3RhdHVzCnJlZ2lzdGVycyByZXF1aXJpbmcgSFcgdG8gdXBk
YXRlIGhhdmUgYSAxIGN5Y2xlIGRlbGF5LCBkdWUgdG8gdGhlCnJlZ2lzdGVyIHVwZGF0ZSBoYXZp
bmcgdG8gZ28gdGhyb3VnaCBHUkJNLgoKU1cgbWF5IG9wZXJhdGUgb24gYW4gaW5jb3JyZWN0IHZh
bHVlIGlmIHRoZXkgd3JpdGUgYSByZWdpc3RlciBhbmQKaW1tZWRpYXRlbHkgY2hlY2sgdGhlIGNv
cnJlc3BvbmRpbmcgc3RhdHVzIHJlZ2lzdGVyLgoKUmVnaXN0ZXJzIHJlcXVpcmluZyBIVyB0byBj
bGVhciBvciBzZXQgZmllbGRzIG1heSBiZSBkZWxheWVkIGJ5IDEgY3ljbGUuCkZvciBleGFtcGxl
LAoKMS4gd3JpdGUgVk1fSU5WQUxJREFURV9FTkcwX1JFUSBtYXNrID0gNWEKMi4gcmVhZCBWTV9J
TlZBTElEQVRFX0VORzBfQUNLIHRpbGwgdGhlIGFjayBpcyBzYW1lIGFzIHRoZSByZXF1ZXN0IG1h
c2sgPSA1YQogICAgYS4gSFcgd2lsbCByZXNldCBWTV9JTlZBTElEQVRFX0VORzBfQUNLID0gMCB1
bnRpbCBpbnZhbGlkYXRpb24gaXMgY29tcGxldGUKMy4gd3JpdGUgVk1fSU5WQUxJREFURV9FTkcw
X1JFUSBtYXNrID0gNWEKNC4gcmVhZCBWTV9JTlZBTElEQVRFX0VORzBfQUNLIHRpbGwgdGhlIGFj
ayBpcyBzYW1lIGFzIHRoZSByZXF1ZXN0IG1hc2sgPSA1YQogICAgYS4gRmlyc3QgcmVhZCBvZiBW
TV9JTlZBTElEQVRFX0VORzBfQUNLID0gNWEgaW5zdGVhZCBvZiAwCiAgICBiLiBTZWNvbmQgcmVh
ZCBvZiBWTV9JTlZBTElEQVRFX0VORzBfQUNLID0gMCBiZWNhdXNlCiAgICAgICB0aGUgcmVtb3Rl
IEdSQk0gaC93IHJlZ2lzdGVyIHRha2VzIG9uZSBleHRyYSBjeWNsZSB0byBiZSBjbGVhcmVkCiAg
ICBjLiBJbiB0aGlzIGNhc2UsIFNXIHdpbGwgc2VlIGEgZmFsc2UgQUNLIGlmIHRoZXkgZXhpdCBv
biBmaXJzdCByZWFkCgpBZmZlY3RlZCByZWdpc3RlcnMgKG9ubHkgR0MgdmFyaWFudCkgIHwgIFJl
Y29tbWVuZGVkIER1bW15IFJlYWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpWTV9JTlZBTElEQVRFX0VORypfQUNLICAg
ICAgICAgICAgICAgIHwgIFZNX0lOVkFMSURBVEVfRU5HKl9SRVEKVk1fTDJfU1RBVFVTICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICBWTV9MMl9TVEFUVVMKVk1fTDJfUFJPVEVDVElPTl9GQVVM
VF9TVEFUVVMgICAgICAgICB8ICBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUwpWTV9MMl9Q
Uk9URUNUSU9OX0ZBVUxUX0FERFJfSEkvTE8zMiAgIHwgIFZNX0wyX1BST1RFQ1RJT05fRkFVTFRf
QUREUl9ISS9MTzMyClZNX0wyX0lIX0xPR19CVVNZICAgICAgICAgICAgICAgICAgICAgfCAgVk1f
TDJfSUhfTE9HX0JVU1kKTUNfVk1fTDJfUEVSRkNPVU5URVJfSEkvTE8gICAgICAgICAgICB8ICBN
Q19WTV9MMl9QRVJGQ09VTlRFUl9ISS9MTwpBVENfTDJfUEVSRkNPVU5URVJfSEkvTE8gICAgICAg
ICAgICAgIHwgIEFUQ19MMl9QRVJGQ09VTlRFUl9ISS9MTwpBVENfTDJfUEVSRkNPVU5URVIyX0hJ
L0xPICAgICAgICAgICAgIHwgIEFUQ19MMl9QRVJGQ09VTlRFUjJfSEkvTE8KClNpZ25lZC1vZmYt
Ynk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAxNSArKysrKysrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgIHwgMTYgKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjEwXzAuYwppbmRleCBkODNkOGE2YTFmYzAuLjU2Zjc2YTFmMzJlZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKQEAgLTEzNSw2ICsxMzUsMTQgQEAgc3RhdGljIGlu
dCBnbWNfdjEwXzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJYWRkciB8PSAoKHU2NCllbnRyeS0+c3JjX2RhdGFbMV0gJiAweGYpIDw8IDQ0OwogCiAJaWYg
KCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKKwkJLyoKKwkJICogSXNzdWUgYSBkdW1teSByZWFk
IHRvIHdhaXQgZm9yIHRoZSBzdGF0dXMgcmVnaXN0ZXIgdG8KKwkJICogYmUgdXBkYXRlZCB0byBh
dm9pZCByZWFkaW5nIGFuIGluY29ycmVjdCB2YWx1ZSBkdWUgdG8KKwkJICogdGhlIG5ldyBmYXN0
IEdSQk0gaW50ZXJmYWNlLgorCQkgKi8KKwkJaWYgKGVudHJ5LT52bWlkX3NyYyA9PSBBTURHUFVf
R0ZYSFVCXzApCisJCQlSUkVHMzIoaHViLT52bV9sMl9wcm9fZmF1bHRfc3RhdHVzKTsKKwogCQlz
dGF0dXMgPSBSUkVHMzIoaHViLT52bV9sMl9wcm9fZmF1bHRfc3RhdHVzKTsKIAkJV1JFRzMyX1Ao
aHViLT52bV9sMl9wcm9fZmF1bHRfY250bCwgMSwgfjEpOwogCX0KQEAgLTIyOCw2ICsyMzYsMTMg
QEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1YihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKIAogCVdSRUczMl9OT19LSVEoaHViLT52bV9pbnZfZW5n
MF9yZXEgKyBlbmcsIHRtcCk7CiAKKwkvKgorCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0
IGZvciB0aGUgQUNLIHJlZ2lzdGVyIHRvIGJlIGNsZWFyZWQKKwkgKiB0byBhdm9pZCBhIGZhbHNl
IEFDSyBkdWUgdG8gdGhlIG5ldyBmYXN0IEdSQk0gaW50ZXJmYWNlLgorCSAqLworCWlmICh2bWh1
YiA9PSBBTURHUFVfR0ZYSFVCXzApCisJCVJSRUczMl9OT19LSVEoaHViLT52bV9pbnZfZW5nMF9y
ZXEgKyBlbmcpOworCiAJLyogV2FpdCBmb3IgQUNLIHdpdGggYSBkZWxheS4qLwogCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgewogCQl0bXAgPSBSUkVHMzJfTk9fS0lR
KGh1Yi0+dm1faW52X2VuZzBfYWNrICsgZW5nKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jCmluZGV4IDZkZTE3MjY3ZmMzNS4uMTc3MDA2MDZmNTRiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTM1Miw2ICszNTIsMTQgQEAgc3RhdGljIGludCBnbWNf
djlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCS8q
IElmIGl0J3MgdGhlIGZpcnN0IGZhdWx0IGZvciB0aGlzIGFkZHJlc3MsIHByb2Nlc3MgaXQgbm9y
bWFsbHkgKi8KIAlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgeworCQkvKgorCQkgKiBJc3N1
ZSBhIGR1bW15IHJlYWQgdG8gd2FpdCBmb3IgdGhlIHN0YXR1cyByZWdpc3RlciB0bworCQkgKiBi
ZSB1cGRhdGVkIHRvIGF2b2lkIHJlYWRpbmcgYW4gaW5jb3JyZWN0IHZhbHVlIGR1ZSB0bworCQkg
KiB0aGUgbmV3IGZhc3QgR1JCTSBpbnRlcmZhY2UuCisJCSAqLworCQlpZiAoZW50cnktPnZtaWRf
c3JjID09IEFNREdQVV9HRlhIVUJfMCkKKwkJCVJSRUczMihodWItPnZtX2wyX3Byb19mYXVsdF9z
dGF0dXMpOworCiAJCXN0YXR1cyA9IFJSRUczMihodWItPnZtX2wyX3Byb19mYXVsdF9zdGF0dXMp
OwogCQlXUkVHMzJfUChodWItPnZtX2wyX3Byb19mYXVsdF9jbnRsLCAxLCB+MSk7CiAJfQpAQCAt
NDgwLDYgKzQ4OCwxNCBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAogCiAJc3Bpbl9sb2NrKCZhZGV2
LT5nbWMuaW52YWxpZGF0ZV9sb2NrKTsKIAlXUkVHMzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBf
cmVxICsgZW5nLCB0bXApOworCisJLyoKKwkgKiBJc3N1ZSBhIGR1bW15IHJlYWQgdG8gd2FpdCBm
b3IgdGhlIEFDSyByZWdpc3RlciB0byBiZSBjbGVhcmVkCisJICogdG8gYXZvaWQgYSBmYWxzZSBB
Q0sgZHVlIHRvIHRoZSBuZXcgZmFzdCBHUkJNIGludGVyZmFjZS4KKwkgKi8KKwlpZiAodm1odWIg
PT0gQU1ER1BVX0dGWEhVQl8wKQorCQlSUkVHMzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBfcmVx
ICsgZW5nKTsKKwogCWZvciAoaiA9IDA7IGogPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGorKykgewog
CQl0bXAgPSBSUkVHMzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBfYWNrICsgZW5nKTsKIAkJaWYg
KHRtcCAmICgxIDw8IHZtaWQpKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
