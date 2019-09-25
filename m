Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE7BE6B9
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 22:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306CB72B41;
	Wed, 25 Sep 2019 20:57:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7259072B37
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 20:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbqiR5IDhekb4CW6MQvoPsxDJzcQKVq3quxD8ciMxhENpjN9B5dayj9tUSv1sXv2Yo6h/g/4MscZDKJMJM5Y5JmS07T9kp3rSRhbGmCmNDMfP/m8tzmWvk6SKxrSsnXAW6I/rA7I15SXQPyec0EisHMg2hJktr2oIcbAAV6k0q+mPp/uGagGMxPbRUYXYqGuO42d8I3WZn6qX2wTuPYSQDrN6ZoCtVfqSARKuLlvA5bRmrx7l2rJWt7dpUX3tw6DF3VW+7QFRD1XP92bqGCFqXZblzSo7zA8JNYAHNLcR+vww9cTVe5/DaPOzTvLFD/L0TDGL+BCnVdfrC1c0KHS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ6fQTu26bwj++g/SXuuoEwId0ndTZrk97z1W8nYdD0=;
 b=fPRe/H1xE5SIava1ge/q5sulI4eTq3ahxSzoqF9Exgp6lqrGQ/DCU8KaWshCl+nk579rEl6tO+cd1vf40w/8o7FRgbtO852APov5MR96unFHOqT7SXis2FJEywmhdlifL8A6sNVPDt4rMPwTE7Pr0XEk9e0+EdOJeZ68TS39sFH9UYD09E1v570zt8C5PYz+RJCnyKiLgl0dN94F67f8BHJlkj0TRWeFy55PDmYIYHpIkaEUc1ZFWMzvP3ZrMOLMEkpO/YVDeXyzO00f6i8vsyQgvBcrGLsL6wX6T9cmOl/EEJD+cX2Fy8WwbW0Qw+QeXnXAgpYy+YpMxp80RkO5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2827.namprd12.prod.outlook.com (20.177.221.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 20:57:42 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 20:57:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBac8g+OAgABPluCAAAFbgIAADJ6A
Date: Wed, 25 Sep 2019 20:57:42 +0000
Message-ID: <cc8905b8-faa5-3d07-92d3-13b38c2c0dbc@amd.com>
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
 <2b7c9fe9-0849-d3a5-99b4-3203c1b82de2@amd.com>
 <DM6PR12MB3241269E6B5007951F0B59BEF4870@DM6PR12MB3241.namprd12.prod.outlook.com>
 <CADnq5_PQV9mPSkzY98GoQU29Sm1ooY2MHhenko2j9_=HFNdYig@mail.gmail.com>
In-Reply-To: <CADnq5_PQV9mPSkzY98GoQU29Sm1ooY2MHhenko2j9_=HFNdYig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72e5a9b3-ff92-4eaa-21d1-08d741fb01ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2827; 
x-ms-traffictypediagnostic: DM6PR12MB2827:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2827EFA6900A3A7C4D671E2492870@DM6PR12MB2827.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(13464003)(189003)(199004)(486006)(6306002)(6512007)(26005)(6246003)(14454004)(65956001)(65806001)(66066001)(4326008)(6436002)(478600001)(186003)(86362001)(31696002)(316002)(53546011)(5660300002)(58126008)(102836004)(110136005)(229853002)(25786009)(256004)(71200400001)(2616005)(386003)(6506007)(6486002)(6116002)(3846002)(8936002)(476003)(81166006)(305945005)(52116002)(7736002)(66946007)(71190400001)(31686004)(6636002)(66476007)(446003)(966005)(8676002)(2906002)(11346002)(66446008)(66556008)(64756008)(76176011)(36756003)(81156014)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2827;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8cHPXlBfVB7m6aPJSb2w31lng7wmZsgCWXhmsAMFiMlN4oKfqAjlQy98NfeJ3fham1GFjHomGx9T52V0nXE4Mor+WIQOqc+c4OBtteqTkY0HwGj2tLox2FJue9pdqJwxSt1WktBA6o9rcEVPMkkCzSYmhk/kZYN67m7TSVXKfqy5fFkzPh0z3ADTPMqLCOML7Yl1J1DG4pWBa45k1KrQL7IH2qoMYYzMt+q/KyIj2Nb+AnQSF3CJhpKBCSjKpNnbHfLG7MXA50nCy9M+VRscTmhyQ4fgqab/TYubqaKsv86rn5oOG32DNlqwNDj/8F6/obMen1UKkIamuQ/5wOu9VIyjcCNNzUXmUZUO492tlXPo6bmz6LZa5CUjd38pKWmM8YnEmRJ5ODb5w9CqMKw6F4/UHMvAx2k5Jk67p4x+WBFdB8OKJFZo/RvJ8Gbpdu7VqQBf0zcFnmxrYIwfwh9Kcg==
Content-ID: <6E7DD8ADDA2F1046A3F191E297C63660@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e5a9b3-ff92-4eaa-21d1-08d741fb01ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 20:57:42.4397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sNumSGgxPDm0T/jA+YvgRw3ZOLmtv1LqhhCqBJ9itSWMjSkXHsgTa+RkrrJnF9wjQZDxD+pfTpe8/sblpvx2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2827
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ6fQTu26bwj++g/SXuuoEwId0ndTZrk97z1W8nYdD0=;
 b=jNsuvM+dU7aiLJrk3t9VYBNuQhw7KdYcW2sT+AafPICLD15eKJ9uEHP5sGd+CheUntmOtufUDG/haNU0jK5iz6J2k+q6GgoswBU5p5R/wGteH8HJkGYOC4SC+l6euYKFPcOSb5OpYyQDVuYZk1mmuVjr2cfZW+a6CzEZ9vq9g/0=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWdyZWVkLiBLRkQgaXMgcGFydCBvZiBhbWRncHUuIFdlIHNob3VsZG4ndCB1c2UgdGhlIENISVBf
IElEcyANCmRpZmZlcmVudGx5IGluIEtGRC4gVGhlIGNvZGUgZHVwbGljYXRpb24gaXMgbWluaW1h
bCBhbmQgd2UndmUgZG9uZSBpdCANCmZvciBhbGwgY2hpcHMgc28gZmFyLiBFLmcuIEZpamkgYW5k
IGFsbCB0aGUgUG9sYXJpcyB2ZXJzaW9ucyBhcmUgdHJlYXRlZCANCnRoZSBzYW1lIGluIEtGRC4g
U2ltaWxhcmx5IFZlZ2ExMCwgVmVnYTIwIGFuZCBBcmN0dXJ1cyBhcmUgdGhlIHNhbWUgZm9yIA0K
bW9zdCBwdXJwb3Nlcy4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA5LTI1IDQ6
MTIgcC5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFu
ZXIgdG8gYWRkIG5hdmkxMiB0byBhbGwgb2YgdGhlIHJlbGV2YW50DQo+IGNhc2VzLiAgV2Ugc2hv
dWxkIGRvdWJsZSBjaGVjayB3aGF0IHdlIGRpZCBmb3IgbmF2aTE0IGFzIHdlbGwuDQo+DQo+IEFs
ZXgNCj4NCj4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNDowOSBQTSBMaXUsIFNoYW95dW4gPFNo
YW95dW4uTGl1QGFtZC5jb20+IHdyb3RlOg0KPj4gSSBzZW50IG91dCBhbm90aGVyIGNoYW5nZSB0
aGF0IHNldCB0aGUgIGFzaWNfZmFtaWx5IGFzIENISVBfTkFWSTEwIHNpbmNlIGZyb20gS0ZEIHNp
ZGUgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSBmb3IgbmF2aTEwIGFuZCAgbmF2aTEyLg0KPj4NCj4+
IFJlZ2FyZHMNCj4+IFNoYW95dW4ubGl1DQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4+IEZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+
IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDE5IDExOjIzIEFNDQo+PiBUbzogTGl1
LCBTaGFveXVuIDxTaGFveXVuLkxpdUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEFkZCBOQVZJMTIgc3Vw
cG9ydCBmcm9tIGtmZCBzaWRlDQo+Pg0KPj4gWW91J2xsIGFsc28gbmVlZCB0byBhZGQgImNhc2Ug
Q0hJUF9OQVZJMTI6IiBpbiBhIGJ1bmNoIG9mIHBsYWNlcy4gR3JlcCBmb3IgIkNISVBfTkFWSTEw
IiBhbmQgeW91J2xsIGZpbmQgdGhlbSBhbGwgcHJldHR5IHF1aWNrbHkuDQo+Pg0KPj4gUmVnYXJk
cywNCj4+ICAgICBGZWxpeA0KPj4NCj4+IE9uIDIwMTktMDktMjQgNjoxMyBwLm0uLCBMaXUsIFNo
YW95dW4gd3JvdGU6DQo+Pj4gQWRkIGRldmljZSBpbmZvIGZvciBib3RoIG5hdmkxMiBQRiBhbmQg
VkYNCj4+Pg0KPj4+IENoYW5nZS1JZDogSWZiNDAzNWU2NWMxMmQxNTNmYzMwZTU5M2ZlMTA5Zjlj
N2UwNTQxZjQNCj4+PiBTaWduZWQtb2ZmLWJ5OiBzaGFveXVubCA8c2hhb3l1bi5saXVAYW1kLmNv
bT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYw0KPj4+IGluZGV4IGYzMjliODIuLmVkZmJhZTVjIDEwMDY0NA0KPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPj4+IEBAIC0zODcsNiArMzg3LDI0IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9kZXZpY2VfaW5mbyA9
IHsNCj4+PiAgICAgICAgLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gOCwNCj4+PiAgICB9
Ow0KPj4+DQo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMl9k
ZXZpY2VfaW5mbyA9IHsNCj4+PiArICAgICAuYXNpY19mYW1pbHkgPSBDSElQX05BVkkxMiwNCj4+
PiArICAgICAuYXNpY19uYW1lID0gIm5hdmkxMiIsDQo+Pj4gKyAgICAgLm1heF9wYXNpZF9iaXRz
ID0gMTYsDQo+Pj4gKyAgICAgLm1heF9ub19vZl9ocWQgID0gMjQsDQo+Pj4gKyAgICAgLmRvb3Ji
ZWxsX3NpemUgID0gOCwNCj4+PiArICAgICAuaWhfcmluZ19lbnRyeV9zaXplID0gOCAqIHNpemVv
Zih1aW50MzJfdCksDQo+Pj4gKyAgICAgLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9p
bnRlcnJ1cHRfY2xhc3NfdjksDQo+Pj4gKyAgICAgLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LA0K
Pj4+ICsgICAgIC5tcWRfc2l6ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwNCj4+PiArICAg
ICAubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFsc2UsDQo+Pj4gKyAgICAgLnN1cHBvcnRzX2N3c3Ig
PSB0cnVlLA0KPj4+ICsgICAgIC5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLA0KPj4+ICsgICAg
IC5udW1fc2RtYV9lbmdpbmVzID0gMiwNCj4+PiArICAgICAubnVtX3hnbWlfc2RtYV9lbmdpbmVz
ID0gMCwNCj4+PiArICAgICAubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LA0KPj4+ICt9
Ow0KPj4+ICsNCj4+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZp
MTRfZGV2aWNlX2luZm8gPSB7DQo+Pj4gICAgICAgIC5hc2ljX2ZhbWlseSA9IENISVBfTkFWSTE0
LA0KPj4+ICAgICAgICAuYXNpY19uYW1lID0gIm5hdmkxNCIsDQo+Pj4gQEAgLTQyNSw2ICs0NDMs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1cHBvcnRlZF9k
ZXZpY2VzW11bMl0gPSB7DQo+Pj4gICAgICAgIFtDSElQX1JFTk9JUl0gPSB7JnJlbm9pcl9kZXZp
Y2VfaW5mbywgTlVMTH0sDQo+Pj4gICAgICAgIFtDSElQX0FSQ1RVUlVTXSA9IHsmYXJjdHVydXNf
ZGV2aWNlX2luZm8sICZhcmN0dXJ1c19kZXZpY2VfaW5mb30sDQo+Pj4gICAgICAgIFtDSElQX05B
VkkxMF0gPSB7Jm5hdmkxMF9kZXZpY2VfaW5mbywgTlVMTH0sDQo+Pj4gKyAgICAgW0NISVBfTkFW
STEyXSA9IHsmbmF2aTEyX2RldmljZV9pbmZvLCAmbmF2aTEyX2RldmljZV9pbmZvfSwNCj4+PiAg
ICAgICAgW0NISVBfTkFWSTE0XSA9IHsmbmF2aTE0X2RldmljZV9pbmZvLCBOVUxMfSwNCj4+PiAg
ICB9Ow0KPj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
