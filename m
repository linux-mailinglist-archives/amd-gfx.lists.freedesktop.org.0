Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68E65BA1
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 18:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03689D57;
	Thu, 11 Jul 2019 16:38:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C31D89D57
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 16:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiarnJHzPc2jJ5agYL9b18rPiDlSn5eGduURik5it5EpQ/sD62/fxgRre5nG19/25t28DRKI9fgoeisVHQ0OW2WTe347AAaXLit55CbVO/7cM+xZLacSQRbG1RTCuKJNJkkSZCUzQhGW/MJcUf0Oe5xairIKfUKcKS4QEmjyGyKN0vMO8ojhTEyj8VmfuD2fEvwX05MIob316rmHsDEyzPqnkwhSvLChbOUN4zGXqNYJOfG161NWyvxK3lmsmkDptFQ67JB9Y7BQyWk46yUIfQJo/velpPqMGHpVQcsR6MQrdsBt6N2BF9O1L7aFD6Jc8aa6OjPfF3w1APiL46zn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrIaYCWs8CNZZsJ0aUCecusjKUeKNvUDqimMpXSxy1o=;
 b=EgQv2JdRlv/PN9FLmq0IjJB6oj4yaSn9a702Z3JPobDGn4FGLkJ8ieDVkyoJ5zc+V/3MXHQGG7VZsSVfa551fMBm9moTv1qcb1XKvNNbp6yyPECedILbh7u15duvOhuisP8d7vOeFnwOqGqnNDFDt547gtKWPr62YMy64qFf8DXPFhIIMx1ckCG7CCvEKJbikPStrAf6PGK6vc0oDNCkutwRzgFBlL1FnmNdJJ6Neaz/ErVy8QELoUk1GW0k7hTIMyLab2Ixi3xPiS9ED0jqG0bdZYXAXfd7Apx5uuLvHLKLWtjC9lkfLl6GUiddJBOFJJnXmhX4FAzjmG+RpzFO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2969.namprd12.prod.outlook.com (20.178.29.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 16:38:37 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 16:38:37 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Topic: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Index: AQHVNzMOyh0y41xtzkOlOnqCEyNiHKbFn8UA
Date: Thu, 11 Jul 2019 16:38:37 +0000
Message-ID: <52c25e2d-f080-0474-7132-dc7a7ff635b9@amd.com>
References: <1562772046-7681-1-git-send-email-JinhuiEric.Huang@amd.com>
In-Reply-To: <1562772046-7681-1-git-send-email-JinhuiEric.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f5aaace-5381-41a9-4ae5-08d7061e3960
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2969; 
x-ms-traffictypediagnostic: DM6PR12MB2969:
x-microsoft-antispam-prvs: <DM6PR12MB29690DE743271D15A8FBD7D892F30@DM6PR12MB2969.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(189003)(199004)(66946007)(58126008)(68736007)(11346002)(64126003)(65826007)(6436002)(14454004)(5660300002)(64756008)(66446008)(14444005)(256004)(53936002)(66476007)(66556008)(2501003)(2616005)(76176011)(8936002)(486006)(446003)(476003)(81156014)(81166006)(305945005)(65806001)(71190400001)(71200400001)(31696002)(86362001)(26005)(31686004)(36756003)(6116002)(3846002)(6486002)(386003)(6506007)(53546011)(229853002)(25786009)(66066001)(102836004)(52116002)(6512007)(6246003)(316002)(8676002)(110136005)(99286004)(186003)(478600001)(7736002)(65956001)(2906002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2969;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HaYyuf/fPC4wf/j0JJJ3v6EjXssmnXh+VAyRxn6/LXLjPxgSUzB8ennPJNc+HZH2SDes/O8hcqdA9BZUCZZh0Gg/AeDcQ6tVzyjo5GV7qQyjFGTcOdkVHvxD+/YzXHuPbVB8KOX6A7Qz5S4q8DnF3As45O2HQ1qKZengW79YdoywA/An//4dfn5GFNULkOB9wl+dqI4fgZKfvPotUTcvCWcR7ME+yZ/I+7CKVcAG9klQ+N2yOzOW4C8nxljkPUJTHhJItMck0vwm14q2LaM7j7a9QJHHg8GFksTVMGWbNDNVjD2f+GYhDQrpxj//O2wN1shQ7DxzigztI/HxTTUiUpX9yg2SMgP5eWAXeAMC2NftIoZPfYa1rYEIPFro/ikKJvr6qtHF00SxtCW1GQEjFZmYDJUm5GAZpPq26fQ7uI4=
Content-ID: <870F95C8DBC6494BB07A437AFD1A1CB5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5aaace-5381-41a9-4ae5-08d7061e3960
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 16:38:37.8831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrIaYCWs8CNZZsJ0aUCecusjKUeKNvUDqimMpXSxy1o=;
 b=rixxVgLQ9aY/ekitYeGNZQ5zdOHRnsUrcsr+szwRaqa08ZbX5Wtnavd1fse8JdCI6YyosDjTFodXf1rzeryH+0b2Dn/dvVaq0mcUVjFrx1Uyw2hEvW4+W4ENZycBGQXiqH0xPhyy5HU4QRcag5GXfxiSDqKoZQAg0lFuys5lubM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNy0xMCAxMToyMCBhLm0uLCBIdWFuZywgSmluSHVpRXJpYyB3cm90ZToNCj4gVGhl
IGNwIGhhbmcgb2NjdXJzIGluIE9DTCBjb25mb3JtYW5jZSB0ZXN0IG9ubHkgb24gc3VwZXJtaWNy
bw0KPiBwbGF0Zm9ybSB3aGljaCBoYXMgNDAgY29yZXMgYW5kIHRoZSB0ZXN0IGdlbmVyYXRlcyA0
MCB0aHJlYWRzLg0KPiBUaGUgcm9vdCBjYXVzZSBpcyByYWNlIGNvbmRpdGlvbiBpbiBub24tcHJv
dGVjdGVkIGZsYWdzLg0KPg0KPiBUaGUgZml4IGlzIHRvIGFkZCBmbGFncyBvZiBpc19ldmljdGVk
IGFuZCBpc19hY3RpdmUoaW5pdF9tcWQoKSkNCj4gaW50byBwcm90ZWN0ZWQgYXJlYS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogRXJpYyBIdWFuZyA8SmluaHVpRXJpYy5IdWFuZ0BhbWQuY29tPg0KDQpT
b3JyeSwgSSBtaXNzZWQgdGhpcyBvbmUuIEkgb25seSBzYXcgdGhlIG9uZSBlYXJsaWVyIHRoYXQg
eW91IHJlY2FsbGVkLg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
Yw0KPiBpbmRleCA5ZmZkZGE1Li5mMjNlMTdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBAQCAtMTE1
NywxMiArMTE1Nyw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQo+ICAgDQo+ICAgCW1xZF9t
Z3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQo+ICAgCQkJ
cS0+cHJvcGVydGllcy50eXBlKV07DQo+IC0JLyoNCj4gLQkgKiBFdmljdGlvbiBzdGF0ZSBsb2dp
YzogbWFyayBhbGwgcXVldWVzIGFzIGV2aWN0ZWQsIGV2ZW4gb25lcw0KPiAtCSAqIG5vdCBjdXJy
ZW50bHkgYWN0aXZlLiBSZXN0b3JpbmcgaW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkNCj4gLQkg
KiB1cGRhdGVzIHRoZSBpc19ldmljdGVkIGZsYWcgYnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLg0K
PiAtCSAqLw0KPiAtCXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9ICEhcXBkLT5ldmljdGVkOw0K
PiArDQo+ICAgCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSB8
fA0KPiAgIAkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkN
Cj4gICAJCWRxbS0+YXNpY19vcHMuaW5pdF9zZG1hX3ZtKGRxbSwgcSwgcXBkKTsNCj4gQEAgLTEx
NzMsOSArMTE2OCwxNiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3QgZGV2
aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KPiAgIAkJcmV0dmFsID0g
LUVOT01FTTsNCj4gICAJCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+ICAgCX0NCj4g
Kw0KPiArCWRxbV9sb2NrKGRxbSk7DQo+ICsJLyoNCj4gKwkgKiBFdmljdGlvbiBzdGF0ZSBsb2dp
YzogbWFyayBhbGwgcXVldWVzIGFzIGV2aWN0ZWQsIGV2ZW4gb25lcw0KPiArCSAqIG5vdCBjdXJy
ZW50bHkgYWN0aXZlLiBSZXN0b3JpbmcgaW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkNCj4gKwkg
KiB1cGRhdGVzIHRoZSBpc19ldmljdGVkIGZsYWcgYnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLg0K
PiArCSAqLw0KPiArCXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9ICEhcXBkLT5ldmljdGVkOw0K
PiAgIAltcWRfbWdyLT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFkLCBxLT5tcWRfbWVtX29iaiwN
Cj4gICAJCQkJJnEtPmdhcnRfbXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsNCj4gLQlkcW1fbG9j
ayhkcW0pOw0KPiAgIA0KPiAgIAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3Qp
Ow0KPiAgIAlxcGQtPnF1ZXVlX2NvdW50Kys7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
