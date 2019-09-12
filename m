Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C6B0844
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 07:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304B6E136;
	Thu, 12 Sep 2019 05:29:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710085.outbound.protection.outlook.com [40.107.71.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0E66E136
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 05:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn9oEzKz62KPF0VgZm2BHAe7eMqbYkRv/EyNMSgS+iLp0KFiUywLCbYAM9Mnn/yVHmchKsIDB5/9ZZG5l4VSWBSWuYjOKaefZlLwwX8J4OqhsCwxiCFd9Vu1+6vRhc4yngseFvSAJoqQLTo1oJrSFoZm9Gzdo8EyahDD+EsdVjcbqgVGFZ9Ve4CBLlHtRuLTjehckZlYvphECXnkSCLTrRkBjT9kVk/ZhRiqE0CQ9RYsGAC+ghXs1fiYbLF73X/3g7nitnfOzLRlRTT0A3Jxa8SgKvI6EgsjIE4J2uYZRu7Q3A4B7Wq2LeEhizzvsvFvwpL1ffsCKpHXX7hMTRbf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHWWhbkU5tAtsjIhnoSJ6rcUGjzlYNqCRu6c1KmX44I=;
 b=ZPhboFWFhIbHH5UvuufKj5RUIDDYpxB3PKiJsSiyWaSTOsEpxd6CaxLbDQUz4/fQ+lDlmb2H/5YL6++0NcdoMeqe281SeHNR4M+p1cmSwU6TbvPJ2oFZUZEqzOqjZdEl6dhzoBeeNTW9KuHyVPbe5fdADqxsEyALzxitj5ZHnbG1KT0k+yb9cxW/RJnmD5Wlu6Lfjonyabz1ezPPQNzQUiKa6FMi2wp8ymSiMTeRrbsz+I6aq5SZtN9yNlsOjgAX/Iwfyqk1pc1HkxmYpUSHCYmLkTROWgY2Mh2OFBON2zrtk6HrTMcveX27+d1fjz6Uuvrw7i9CIvHJJiXKXnCzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 12 Sep 2019 05:29:54 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 05:29:54 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Navi12 SRIOV VF doesn't load TOC
Thread-Topic: [PATCH] drm/amdgpu: Navi12 SRIOV VF doesn't load TOC
Thread-Index: AQHVaSoMzempo8OpUUaV9RGP/6eoI6cng9Hw
Date: Thu, 12 Sep 2019 05:29:54 +0000
Message-ID: <MN2PR12MB297593849C679DA47549C7FA8FB00@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190912052158.20362-1-jianzh@amd.com>
In-Reply-To: <20190912052158.20362-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c768bd1-678f-44cf-100c-08d737423e59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4016081975BE3F4B98A34F3D8FB00@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39850400004)(366004)(396003)(376002)(189003)(199004)(13464003)(81166006)(66446008)(6116002)(55016002)(54906003)(86362001)(71200400001)(9686003)(53936002)(110136005)(256004)(6246003)(6506007)(2501003)(71190400001)(25786009)(7736002)(26005)(102836004)(305945005)(6436002)(4326008)(229853002)(316002)(99286004)(74316002)(186003)(486006)(446003)(11346002)(2906002)(33656002)(8676002)(14454004)(7696005)(8936002)(52536014)(476003)(76176011)(66946007)(66556008)(81156014)(64756008)(66066001)(76116006)(66476007)(5660300002)(3846002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PNraQCqpNN9yyq0kLCbsHQnD9qZe4Dre68qaGg/Q9r27IzUZL/PErYi2v/mu9U7X9A8ChKBtKiU4TtODhf6/eBywX2GKmz3rYDNZjSehPcNsRGfUCr/r7379HHLkhWgkcdxK+9mYbSnOWqHN6j9+6Ol+N1O5CgX38meoYoJTg6/3NVzNuapVrMQ4w2fcePkqvgQsKI/rJqX9a0smutLoNmQvGjiRU3zIooSzc2xJ2Pgkigmazl4AAVtobpRyqs9d1B0UkSWpljjKokFTRXXdFCtf4GDpSvmfcvGQ/M8gZPcgaWYCDSkFVlE5xopMlLh6XN61Bpne+NTZGFRVdGPyL6pig5TpznEehiACnmJ4Ll7dacCDBwT2NW40eeI4z3evXhLVoy6QYIi7UMy73QSLyCCI2Ol/2+23dprUvzA7Gb8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c768bd1-678f-44cf-100c-08d737423e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 05:29:54.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tln2c5b2ntibLbdgH+bEMVhHMhWs3hW9XfwML9SxrognK8q24bco0oSkkIrtYipS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHWWhbkU5tAtsjIhnoSJ6rcUGjzlYNqCRu6c1KmX44I=;
 b=DYnBQmEaYbXtLNeWwPmMNAptwzpv+8Y5zxMTf7gRjBmb2ColDS+rip0FMSD2M1gmKcOl4Y8d0aPpCCIT6cGR1P47UUqCQFoiUvIcmZEb1y0TBdvlxYSNtBsI2lvTar7VqfXffhEzwix/TNXhtfmlbNCnYknVJimihajZEqNGzqQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KCj4tLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+RnJvbTogWmhhbywgSmlhbmdlIDxKaWFuZ2UuWmhhb0BhbWQuY29t
Pgo+U2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMiwgMjAxOSAxOjIyIFBNCj5UbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPkNjOiBOaWV0bywgRGF2aWQgTSA8RGF2aWQuTmlldG9A
YW1kLmNvbT47IERlbmcsIEVtaWx5Cj48RW1pbHkuRGVuZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47Cj5aaGFvLCBKaWFuZ2UgPEppYW5nZS5a
aGFvQGFtZC5jb20+Cj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IE5hdmkxMiBTUklPViBW
RiBkb2Vzbid0IGxvYWQgVE9DCj4KPkZyb206IEppYW5nZSBaaGFvIDxKaWFuZ2UuWmhhb0BhbWQu
Y29tPgo+Cj5JbiBTUklPViBjYXNlLCB0aGUgYXV0b2xvYWQgc2VxdWVuY2UgaXMgdGhlIHNhbWUK
Pgo+YXMgYmFyZSBtZXRhbCwgZXhjZXB0IFZGIHdvbid0IGxvYWQgVE9DLgo+Cj5TaWduZWQtb2Zm
LWJ5OiBKaWFuZ2UgWmhhbyA8SmlhbmdlLlpoYW9AYW1kLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDYgKystLS0tCj4gMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKPmluZGV4IGY5MGEwY2QxMjgyNy4uNzYyYzk3Y2U4MjUxIDEwMDY0
NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4rKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKPkBAIC0yNTMsNyArMjUzLDgg
QEAgc3RhdGljIGludCBwc3BfdG1yX2luaXQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCj4KPiAJ
LyogRm9yIEFTSUNzIHN1cHBvcnQgUkxDIGF1dG9sb2FkLCBwc3Agd2lsbCBwYXJzZSB0aGUgdG9j
Cj4gCSAqIGFuZCBjYWxjdWxhdGUgdGhlIHRvdGFsIHNpemUgb2YgVE1SIG5lZWRlZCAqLwo+LQlp
ZiAocHNwLT50b2Nfc3RhcnRfYWRkciAmJgo+KwlpZiAoIWFtZGdwdV9zcmlvdl92Zihwc3AtPmFk
ZXYpICYmCj4rCSAgICBwc3AtPnRvY19zdGFydF9hZGRyICYmCj4gCSAgICBwc3AtPnRvY19iaW5f
c2l6ZSAmJgo+IAkgICAgcHNwLT5md19wcmlfYnVmKSB7Cj4gCQlyZXQgPSBwc3BfbG9hZF90b2Mo
cHNwLCAmdG1yX3NpemUpOwo+QEAgLTEzMDUsOSArMTMwNiw2IEBAIGludCBwc3BfcmxjX2F1dG9s
b2FkX3N0YXJ0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQo+IAlpbnQgcmV0Owo+IAlzdHJ1Y3Qg
cHNwX2dmeF9jbWRfcmVzcCAqY21kOwo+Cj4tCWlmIChhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2
KSkKPi0JCXJldHVybiAwOwo+LQo+IAljbWQgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgcHNwX2dm
eF9jbWRfcmVzcCksIEdGUF9LRVJORUwpOwo+IAlpZiAoIWNtZCkKPiAJCXJldHVybiAtRU5PTUVN
Owo+LS0KPjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
