Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212E8C760
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 04:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658AE6E1B5;
	Wed, 14 Aug 2019 02:24:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F776E1B5
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 02:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwrvGm6gSzpb1f4bZghGNixV0eRGI7bVlcUSTzHck5woHlduR2nQ9G60C52LJ/oTdWjFWvWXs88B9ySdsAmowmV76z+oEQyhI8BojqujC6cU+GsdlFZXMRDLJRyuSLbFiAmlZy7pAlXNxCEmiSOfhgXW8Eli0jKGrPsqS/B/tGRM6bgs9lAebfXHmhZLCQ5Z6kVCTcEIhzqt/l/W+aLuPY8DLfLKl6pLK9Y3+WsHb/KeWZ/BJ2g+se2QB+pjHOZxOIxp1z6bUg10MPcYxESK31yVrtG3DNy0bg4ayci4nigFR2ebO7+YvrlFhyrQKxnpXea4luFM92iBa2ROImomLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5JlL2kd5dfQwz4PmePAOxmHqcwD1z8lmjI+hvALlmo=;
 b=jtAXUvNYr/MxsiifjrA+XcSLNDqJVXrU1zHSFBmFylIFT3D9kbks4IXYtuJv4LwYQb1IpMXgMElISrhBi+LGM4G8ZQx4a9U4cRLLlALsl71ysOEPvNaIvlgtEOQ7ENQ8CgQ0fwu2CdEbZFGWKRbFTUB0ycZ+rToPlzt8fgrGuCYtPLDdI6j60wOBMPD0J3E+n8STVeZzpDSWuQsp83Gwg+MwdrdbnjcICYItS25W2rCsZkqHZGFP6fgPiyKMBKKdjtQeEjCXgrJsLvAGD00bFMhFcN91DtTXHRf6vhheTSHRhNpkXCuDjPX9JCQ8pYrMEHAw4MojECElMEvccTS/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3342.namprd12.prod.outlook.com (20.178.240.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 14 Aug 2019 02:24:00 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 02:24:00 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Topic: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Index: AQHVUf+rBKdu1Cc2XUOu8rZVm9MRx6b56SuA
Date: Wed, 14 Aug 2019 02:24:00 +0000
Message-ID: <MN2PR12MB30542C37DA293DFADD11EE3EB0AD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f748c7-109d-4492-c63f-08d7205e77b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3342; 
x-ms-traffictypediagnostic: MN2PR12MB3342:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB334269275E7EC3EDC29ED340B0AD0@MN2PR12MB3342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(13464003)(189003)(199004)(2906002)(14454004)(66556008)(99286004)(52536014)(186003)(256004)(81156014)(64756008)(86362001)(476003)(7736002)(4326008)(66066001)(55016002)(76176011)(966005)(76116006)(66476007)(74316002)(486006)(26005)(11346002)(66946007)(3846002)(66446008)(5660300002)(6246003)(446003)(33656002)(7696005)(305945005)(6116002)(229853002)(54906003)(6506007)(81166006)(316002)(6436002)(6306002)(71190400001)(9686003)(102836004)(53546011)(53936002)(8676002)(478600001)(2501003)(25786009)(71200400001)(8936002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3342;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8g7hJ/me0S7Ty9V+5fQ5abt0prS56GZUCVVKO0CxgTUMktxjf9B6Htq9OXx2AgUK9vAdBzckegKBCqtvXXSmKc8RaOmPKhC4oTDkOH5JUtAx4YPs+4On2uxmYGBEPIfoFHoHPKTtFd8H0BM9+MshXh8pJS1tUBKWq0kjH8ZtqqUgbhPfuJSW6Tdb8CGXs3jSFET3l6lZeXfBs0ppjSDl6XzUzjCnyxpr9MoLkioEUUNLmz155IytsXs/E6po0X2j5UkqDi8VhV6VZkvliLDkf1dW5SpyRzNKVlhHg9sbloXiBmocIDBDX98otVburDPRiUGwpLutLrSrLNIuxilM3v9sHr5E6X1s4s5bCnXwyiBtXDQ+3sLYQKP6LdvgzAeB1COvoi3MohgVBei/aJXxswCkTthg8ijq2+yRhxSdG2Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f748c7-109d-4492-c63f-08d7205e77b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 02:24:00.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rV+VqAxX+OhyS/QxWcyKrs5Kg2qv5/bl/Vc6L9bMF3BYTP14IBR8halR63I5qzdA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5JlL2kd5dfQwz4PmePAOxmHqcwD1z8lmjI+hvALlmo=;
 b=messo7Pgl37NyR1cjm6Dr9bFdyTHN2L7SAa3zZ6qS65M8sYDpTECjukJ/K0GgLzb88ROvyeQqG+sh3MqbSZUYEfbchwLOCAQFnihANxFZ0KPw6vTZVdh79TzFfCui4NjY7Oqk255xeUB6/4YFP4Z86FpmN9GB1CgvGxxgPkOgsg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQW5kcmV5Og0KDQpJJ20gYWxzbyB3b3JraW5nIG9uIHJhcyBlcnJvciBhZGRyZXNzIHNhdmlu
ZyBiYXNlZCBvbiB5b3VyIGVlcHJvbSBwYXRjaGVzLCBhbmQgdGhlIGltcGxlbWVudGF0aW9uIGlz
IGRpZmZlcmVudCBmcm9tIHlvdS4NCkknbGwgc2VuZCBvdXQgbXkgcGF0Y2hlcyB0aGlzIHdlZWsg
YW5kIHdlIGNhbiBkaXNjdXNzIGl0Lg0KDQpSZWdhcmRzLA0KVGFvDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEFuZHJleSBHcm9kem92c2t5DQo+IFNlbnQ6
IDIwMTnlubQ45pyIMTTml6UgMTo1MQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IEdyb2R6b3Zza3ksDQo+IEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IFBhbiwg
WGluaHVpDQo+IDxYaW5odWkuUGFuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBGaXggbnVs
bCBwdHIgd2hlbiBjYWxsaW5nDQo+IHF1ZXJ5X3Jhc19lcnJvcl9jb3VudA0KPiANCj4gcmFzX2Vy
cl9kYXRhLmVycl9hZGRyIHdhcyBuZXZlciBhbGxvY2F0ZWQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBpbmRleCA1MGMxM2IwLi5kOWZi
ODYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IEBA
IC0xMDExLDYgKzEwMTEsMjEgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFu
ZGxlcihzdHJ1Y3QNCj4gcmFzX21hbmFnZXIgKm9iaikNCj4gIAlpbnQgcmV0Ow0KPiAgCXN0cnVj
dCByYXNfZXJyX2RhdGEgZXJyX2RhdGEgPSB7MCwgMCwgMCwgTlVMTH07DQo+IA0KPiArCS8qIEFs
bG9jYXRlIGVub3VnaCB0byBzZXJ2ZSBtYXggIG51bWJlciBvZiByZXF1ZXN0cyovDQo+ICsJaW50
IGVycl9hZGRyX3NpemUgPSBkYXRhLT5yaW5nX3NpemUgLyBkYXRhLT5hbGlnbmVkX2VsZW1lbnRf
c2l6ZSAqDQo+ICsJCQkgICBvYmotPmFkZXYtPnVtYy51bWNfaW5zdF9udW0gKg0KPiArCQkJICAg
b2JqLT5hZGV2LT51bWMuY2hhbm5lbF9pbnN0X251bTsNCj4gKw0KPiArCWVycl9kYXRhLmVycl9h
ZGRyID0ga2NhbGxvYyhlcnJfYWRkcl9zaXplLA0KPiArCQkJCSAgICBzaXplb2YoKmVycl9kYXRh
LmVycl9hZGRyKSwNCj4gKwkJCQkgICAgR0ZQX0tFUk5FTCk7DQo+ICsNCj4gKwlpZiAoIWVycl9k
YXRhLmVycl9hZGRyKSB7DQo+ICsJCURSTV9FUlJPUigiTm90IGVub3VnaCBtZW1vcnkhIik7DQo+
ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKw0KPiAgCXdoaWxlIChkYXRhLT5ycHRyICE9IGRh
dGEtPndwdHIpIHsNCj4gIAkJcm1iKCk7DQo+ICAJCW1lbWNweSgmZW50cnksICZkYXRhLT5yaW5n
W2RhdGEtPnJwdHJdLCBAQCAtMTAzOSw2DQo+ICsxMDU0LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1
X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QgcmFzX21hbmFnZXINCj4gKm9iaikNCj4gIAkJ
CX0NCj4gIAkJfQ0KPiAgCX0NCj4gKw0KPiArCSBrZnJlZShlcnJfZGF0YS5lcnJfYWRkcik7DQo+
ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcHJvY2Vzc19oYW5k
bGVyKHN0cnVjdCB3b3JrX3N0cnVjdA0KPiAqd29yaykNCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZngg
bWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
