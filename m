Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3ED42F3
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 16:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9406EC4A;
	Fri, 11 Oct 2019 14:33:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E257C6EC4A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 14:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tkm6PQMltQHmF4/w2UkKk8MN3hD4Ks0qRr18NlJ9EzybdE8wkboyo6cbAjaYAocoFYlZY1YAtEd78eG9nfoTTqnTV2lqfz4INdMiAUV8EhkjdMLTysom6zIbW+KDxYzXk4DyZC97H8HIxkpSj9Kpy+5D8/ZQ/FxUFBuCd4HuFe6ZS3t6Hh/skhcwoK22WnzCwxD0tYVdeXn+ueKb078qZI1bhAHLr+DxLvLRPKMQ7o7r4ji3fIlXsPo5p3pIzEc9/FjaXWxN+fQRBfETV1Ab/0Na0swLhHLedKaiSH1qx2gs+Vvb8HadZiEfEd2NH7yHgXHK5/SyUyGeYwxrfUyQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNfowK/PxTIws8kGzCp0GUmtQ33NvZ4eHBlwLmyZNWE=;
 b=Jr573IDrw8RbUr81BTYIqfbmfDWZSaQS9+FZZHZNJ6Nh8ioB/bzIBWdENzj1g2ARqpXdTkNZ6x2JXRbyo6D7TMhrWOPX0hQjLTxfelycgZub5RpyjVmcuvT2LHdja+WNtZtFsTjcZdY4lUzzJw1tECxihHajLjPWOMlBe2OPVZlj4tdxkdCF2wiEqSv+Jp2aYeXyYuQCiXsrkrpUjT0lLYGcQAv9VbaQXb3MWAr7LBsxCcGksO4g39evhLawyThj2MMtxTBkn91vliPTiu0N6zSmzmF/VgFvBOVAna6/n7fzABI3Uo+D0MIOdIwLw5Qmv6UPSqWthBe1WMTUrgL3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0021.namprd12.prod.outlook.com (10.172.77.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 11 Oct 2019 14:33:44 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 14:33:44 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: clean up dcn2*_pp_smu functions
Thread-Topic: [PATCH] drm/amdgpu/display: clean up dcn2*_pp_smu functions
Thread-Index: AQHVf3zsX1dzfbhOR0iaD9Ts+SmaIadVgseA
Date: Fri, 11 Oct 2019 14:33:43 +0000
Message-ID: <c8371c14-3418-6ac8-11a0-c84a664590c6@amd.com>
References: <20191010151041.32711-1-alexander.deucher@amd.com>
In-Reply-To: <20191010151041.32711-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac35d5fc-c257-4321-ada7-08d74e580471
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0021:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00217347DD7FA1EB2CEA78218C970@CY4PR1201MB0021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:137;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(110136005)(52116002)(7736002)(54906003)(5660300002)(478600001)(305945005)(58126008)(486006)(476003)(446003)(2616005)(6246003)(256004)(36756003)(14454004)(76176011)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(386003)(53546011)(6506007)(102836004)(2501003)(186003)(11346002)(26005)(99286004)(65806001)(31696002)(8676002)(66066001)(65956001)(4326008)(71190400001)(25786009)(6436002)(71200400001)(6486002)(229853002)(31686004)(8936002)(4001150100001)(81156014)(81166006)(2906002)(6116002)(6512007)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0021;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KQGb6G6upujDPafKGTHRXdLSIx5oQKdNh9M0Hdw5VCz+/eiEK4lO8UJlq9CjLnsJPBERBaCNFj1oSvBpSbmLoCS+K1ZK2fzk4CxOt1Z+XIL3NVkhgd+WbzAShfRkAXQxW2FoQFMuvl6E4O+4/nEyqJGznn2V+hPG97jzyj2FRRnqMljZsOiAkeHVwxQdVXjrH0pulmqiYMXE4GaEFHGKlr/Yi7JYZJ3Ps+S1sVFDQ89f0ZKj00rbyj2pGcPuyFFbxcHXzYIxeZ5mMqLTpgA0UiPScBGv4WsBHZ0L2tB14iVvsi0DWSfliRRefRj87G/ptCA91tj7W2eTyFoYwuDV6TDBB3vyKZ4McOtqXXUZJ8tjHyV4RGYEUTYjdeNyiJJ+w2hIQ8u6o/HrM80wQspYXoWQWmVwwMeiYpZDDQOx9+o=
Content-ID: <5DDE6170CA93D745B556D1D4F097F7ED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac35d5fc-c257-4321-ada7-08d74e580471
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 14:33:44.0409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4vTTwl4czY3O1FLLhdRkWejT3zBFPFijRRVSmxmH3XnGqsT3sz5uww6D1ISpYcA1InOthkne1AmkCtYXpgaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNfowK/PxTIws8kGzCp0GUmtQ33NvZ4eHBlwLmyZNWE=;
 b=fwh1IfbGN6O2nZVLSzs6z8Zt+WX+3Xi0KNqQIyhDF6NiWU2QJJCyyYPDvhTaBXSGJ3fW3HxBNkhxvLlAKRZxS+2qbAoDEliX9Vp+JTeY+gE0/OuDNN42hG0NARbNiMjwJdQbDVvFNj3Jte+ZHrguVUCRwiXnlJJlVYBFDUwFnnw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMCAxMToxMCBhLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFVzZSB0aGUg
ZGNuMjEgZnVuY3Rpb25zIGluIGRjbjIxX3Jlc291cmNlLmMgYW5kIG1ha2UgdGhlDQo+IGRjbjIw
IGZ1bmN0aW9ucyBzdGF0aWMgc2luY2UgdGhleSBhcmUgb25seSB1c2VkIGluDQo+IGRjbjIwX3Jl
c291cmNlIG5vdy4NCj4gDQo+IENjOiBiaGF3YW5wcmVldC5sYWtoYUBhbWQuY29tDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpIYXJy
eQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMgfCA2ICsrKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmggfCAzIC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgfCA0ICsrKy0NCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMNCj4g
aW5kZXggN2FjZTNiMjYxZDg3Li45MTRlMzc4YmNkYTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+IEBA
IC0xMTU2LDYgKzExNTYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlX2NyZWF0ZV9m
dW5jcyByZXNfY3JlYXRlX21heGltdXNfZnVuY3MgPSB7DQo+ICAJLmNyZWF0ZV9od3NlcSA9IGRj
bjIwX2h3c2VxX2NyZWF0ZSwNCj4gIH07DQo+ICANCj4gK3N0YXRpYyB2b2lkIGRjbjIwX3BwX3Nt
dV9kZXN0cm95KHN0cnVjdCBwcF9zbXVfZnVuY3MgKipwcF9zbXUpOw0KPiArDQo+ICB2b2lkIGRj
bjIwX2Nsb2NrX3NvdXJjZV9kZXN0cm95KHN0cnVjdCBjbG9ja19zb3VyY2UgKipjbGtfc3JjKQ0K
PiAgew0KPiAgCWtmcmVlKFRPX0RDRTExMF9DTEtfU1JDKCpjbGtfc3JjKSk7DQo+IEBAIC0yOTI4
LDcgKzI5MzAsNyBAQCBib29sIGRjbjIwX21taHViYnViX2NyZWF0ZShzdHJ1Y3QgZGNfY29udGV4
dCAqY3R4LCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqcG9vbCkNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4g
IH0NCj4gIA0KPiAtc3RydWN0IHBwX3NtdV9mdW5jcyAqZGNuMjBfcHBfc211X2NyZWF0ZShzdHJ1
Y3QgZGNfY29udGV4dCAqY3R4KQ0KPiArc3RhdGljIHN0cnVjdCBwcF9zbXVfZnVuY3MgKmRjbjIw
X3BwX3NtdV9jcmVhdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCkNCj4gIHsNCj4gIAlzdHJ1Y3Qg
cHBfc211X2Z1bmNzICpwcF9zbXUgPSBremFsbG9jKHNpemVvZigqcHBfc211KSwgR0ZQX0tFUk5F
TCk7DQo+ICANCj4gQEAgLTI5NDMsNyArMjk0NSw3IEBAIHN0cnVjdCBwcF9zbXVfZnVuY3MgKmRj
bjIwX3BwX3NtdV9jcmVhdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCkNCj4gIAlyZXR1cm4gcHBf
c211Ow0KPiAgfQ0KPiAgDQo+IC12b2lkIGRjbjIwX3BwX3NtdV9kZXN0cm95KHN0cnVjdCBwcF9z
bXVfZnVuY3MgKipwcF9zbXUpDQo+ICtzdGF0aWMgdm9pZCBkY24yMF9wcF9zbXVfZGVzdHJveShz
dHJ1Y3QgcHBfc211X2Z1bmNzICoqcHBfc211KQ0KPiAgew0KPiAgCWlmIChwcF9zbXUgJiYgKnBw
X3NtdSkgew0KPiAgCQlrZnJlZSgqcHBfc211KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgNCj4gaW5kZXggNDRmOTVh
YTBkNjFlLi41NTAwNjQ2MmY0ODEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oDQo+IEBAIC05NSw5ICs5NSw2
IEBAIHN0cnVjdCBkaXNwbGF5X3N0cmVhbV9jb21wcmVzc29yICpkY24yMF9kc2NfY3JlYXRlKA0K
PiAgCXN0cnVjdCBkY19jb250ZXh0ICpjdHgsIHVpbnQzMl90IGluc3QpOw0KPiAgdm9pZCBkY24y
MF9kc2NfZGVzdHJveShzdHJ1Y3QgZGlzcGxheV9zdHJlYW1fY29tcHJlc3NvciAqKmRzYyk7DQo+
ICANCj4gLXN0cnVjdCBwcF9zbXVfZnVuY3MgKmRjbjIwX3BwX3NtdV9jcmVhdGUoc3RydWN0IGRj
X2NvbnRleHQgKmN0eCk7DQo+IC12b2lkIGRjbjIwX3BwX3NtdV9kZXN0cm95KHN0cnVjdCBwcF9z
bXVfZnVuY3MgKipwcF9zbXUpOw0KPiAtDQo+ICBzdHJ1Y3QgaHVicCAqZGNuMjBfaHVicF9jcmVh
dGUoDQo+ICAJc3RydWN0IGRjX2NvbnRleHQgKmN0eCwNCj4gIAl1aW50MzJfdCBpbnN0KTsNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9y
ZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jl
c291cmNlLmMNCj4gaW5kZXggZDJmYzYxNDkwMDUyLi5mMGM5NWQ4MmZlYjIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNv
dXJjZS5jDQo+IEBAIC02MzYsNiArNjM2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY24xMF9z
dHJlYW1fZW5jb2Rlcl9tYXNrIHNlX21hc2sgPSB7DQo+ICAJCVNFX0NPTU1PTl9NQVNLX1NIX0xJ
U1RfRENOMjAoX01BU0spDQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgdm9pZCBkY24yMV9wcF9zbXVf
ZGVzdHJveShzdHJ1Y3QgcHBfc211X2Z1bmNzICoqcHBfc211KTsNCj4gKw0KPiAgc3RhdGljIHN0
cnVjdCBpbnB1dF9waXhlbF9wcm9jZXNzb3IgKmRjbjIxX2lwcF9jcmVhdGUoDQo+ICAJc3RydWN0
IGRjX2NvbnRleHQgKmN0eCwgdWludDMyX3QgaW5zdCkNCj4gIHsNCj4gQEAgLTkzOSw3ICs5NDEs
NyBAQCBzdGF0aWMgdm9pZCBkZXN0cnVjdChzdHJ1Y3QgZGNuMjFfcmVzb3VyY2VfcG9vbCAqcG9v
bCkNCj4gIAkJZGNuX2RjY2dfZGVzdHJveSgmcG9vbC0+YmFzZS5kY2NnKTsNCj4gIA0KPiAgCWlm
IChwb29sLT5iYXNlLnBwX3NtdSAhPSBOVUxMKQ0KPiAtCQlkY24yMF9wcF9zbXVfZGVzdHJveSgm
cG9vbC0+YmFzZS5wcF9zbXUpOw0KPiArCQlkY24yMV9wcF9zbXVfZGVzdHJveSgmcG9vbC0+YmFz
ZS5wcF9zbXUpOw0KPiAgfQ0KPiAgDQo+ICANCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
