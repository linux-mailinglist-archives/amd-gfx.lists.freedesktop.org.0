Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278D683A5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 08:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1840897B4;
	Mon, 15 Jul 2019 06:44:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700081.outbound.protection.outlook.com [40.107.70.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4004897B4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 06:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQAsMzdvEpTHUVs55QsHEvj6p/f19nvKaAvMJHm6uPW7co/nVj8yRwCuez8YlW6h0xqXtSTBLT6SNDXg7yIDBBGG6irumHwCS7uHYfrfjKuIamKoR8/ybNja4/Q377pTQwJMuPPZ3vRahmYJsM5j2++xihPmUvPzZJTnUNXCQacero0wVakn+V+hi8qg8IZH6RtieJONQdqK8oOtcbbHb6AMPjgE5oBD+Guz1dYkJlXnBH29XT2ZkxaFECfJvzbGm+9L6nENVMKxPTZXlK+I+LqkUOPBwpaWVrLD7VYPFyv3hYi2txy48tpoq08jeQH35aDG3HWf7Cfu5tzcIm8eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gonHe1fhru2FWWSHHXro4ochS/we8E4MqczndEnB8RU=;
 b=neLIZlNs8CWVEiSpCho87liai9IX4pvSa8OEPkvkSYAojsDOY2ZFr3W4dZpihWh2WPFUxJRvQiKN5LehFXvDcOco8FCNtRfKOo46nOsGGUrASgy5sUQq/lVApked1u0JD2WJIl1h9OZ8BvtFc6Qj1sxImJil+gMhdjPdmJlHaIoE0LlWOwPEXqM3P21kGUpyPyPebpihBIep2mig3FcHGsLrex+/Su3Cn9T/vFdSC1ID39nQfyHCVUlbz4EMF0Fysrd3PtlrfzwMG86VXk5SEfYw1MWxxNcRBrTUJHOUJLx0DdKyZBggonpJzR8oiqZSokoantQpDN09DXtnKIXEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1833.namprd12.prod.outlook.com (10.175.90.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 06:44:45 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 06:44:45 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Felix Kuehling <felix.kuehling@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZqZTFL0AgACzGYCAAKw/gIAAZc6AgAAYKICAdITbgIACP3sA
Date: Mon, 15 Jul 2019 06:44:45 +0000
Message-ID: <a8509b2a-7299-be82-b784-ec40a96a41d3@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
 <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
 <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
 <44747586-8c98-6c85-dc5c-7464f59b205e@gmail.com>
In-Reply-To: <44747586-8c98-6c85-dc5c-7464f59b205e@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::23) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1f914f1-048d-47ff-8abc-08d708efec79
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1833; 
x-ms-traffictypediagnostic: DM5PR12MB1833:
x-microsoft-antispam-prvs: <DM5PR12MB18335334618A64CC8DD0182A83CF0@DM5PR12MB1833.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(64126003)(256004)(5660300002)(66476007)(66556008)(64756008)(14444005)(76176011)(486006)(65826007)(66946007)(52116002)(31686004)(446003)(229853002)(6506007)(11346002)(386003)(46003)(102836004)(66446008)(36756003)(316002)(58126008)(71190400001)(476003)(71200400001)(8936002)(2616005)(81166006)(81156014)(186003)(25786009)(65956001)(65806001)(4326008)(2501003)(6116002)(6486002)(6246003)(68736007)(6512007)(478600001)(86362001)(54896002)(14454004)(99286004)(8676002)(6436002)(7736002)(2906002)(53936002)(31696002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1833;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N1rycrSFkkJwKhNFFILat2OtRCHoJZ7DOHMP3iOWd2Kh0ZUajfZXCIQjaKFuNPVRf2bYyOFSmr/tVPKuNQYi7QCDCP10j4/VMIRG5XjJdqoPQrCbIH9QiP4vw31ThfoLRBdrQhPeRjr7BLbaVU81OEg6CFZwQSdb5F96jJs9v4/QuHOVBcHo/wve8G0DwviMlJ4pRhmV0fsFp6jbISOX7oMK4ThE5nCGULswGme7tJoev43xi3o1qIXUAOrQQrXokO7PZGROiu9FqWC62G/KDM2flMw7Oq6HCK4lp3IXDXQSm5Sj0Lkf6XoH1eEus8pX8YMLzX0Tl2t/Np51T1rzvxpDcesgJI/9LOWn7p7/Pj8vUXAe8EFb9WKxMvrF8faV4nBypA3wrkgHXJh0+tA9gCNr16wAI7ZYsWYHBrdEo+U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f914f1-048d-47ff-8abc-08d708efec79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 06:44:45.6771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1833
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gonHe1fhru2FWWSHHXro4ochS/we8E4MqczndEnB8RU=;
 b=ZXzfeyGzuM1h611pSODEoq6xS6LLZWQ5zHLF4YFQDN1j5o40G2jttXUaNAtjjKoUK08FsHoC+SwWbw08FAkY68MHk/74kjPonfwSi13883tP7v+0lvag2Km9LUIyHQ+bj9B6s1+xqwHp8rr/OC5uSlt+DPBrpzshO4Aw7b/yddk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: multipart/mixed; boundary="===============1232321141=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1232321141==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_a8509b2a7299be82b784ec40a96a41d3amdcom_"

--_000_a8509b2a7299be82b784ec40a96a41d3amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QW0gMTMuMDcuMTkgdW0gMjI6MjQgc2NocmllYiBGZWxpeCBLdWVobGluZzoNCkFtIDIwMTktMDQt
MzAgdW0gMTowMyBwLm0uIHNjaHJpZWIgS29lbmlnLCBDaHJpc3RpYW46DQoNClRoZSBvbmx5IHJl
YWwgc29sdXRpb24gSSBjYW4gc2VlIGlzIHRvIGJlIGFibGUgdG8gcmVsaWFibGUga2lsbCBzaGFk
ZXJzDQppbiBhbiBPT00gc2l0dWF0aW9uLg0KDQoNCldlbGwsIHdlIGNhbiBpbiBmYWN0IHByZWVt
cHQgb3VyIGNvbXB1dGUgc2hhZGVycyB3aXRoIGxvdyBsYXRlbmN5Lg0KS2lsbGluZyBhIEtGRCBw
cm9jZXNzIHdpbGwgZG8gZXhhY3RseSB0aGF0Lg0KDQoNCkkndmUgdGFrZW4gYSBsb29rIGF0IHRo
YXQgdGhpbmcgYXMgd2VsbCBhbmQgdG8gYmUgaG9uZXN0IGl0IGlzIG5vdCBldmVuDQpyZW1vdGVs
eSBzdWZmaWNpZW50Lg0KDQpXZSBuZWVkIHNvbWV0aGluZyB3aGljaCBzdG9wcyB0aGUgaGFyZHdh
cmUgKmltbWVkaWF0ZWx5KiBmcm9tIGFjY2Vzc2luZw0Kc3lzdGVtIG1lbW9yeSwgYW5kIG5vdCB3
YWl0IGZvciB0aGUgU1EgdG8ga2lsbCBhbGwgd2F2ZXMsIGZsdXNoIGNhY2hlcw0KZXRjLi4uDQoN
Ck9uZSBwb3NzaWJpbGl0eSBJJ20gcGxheWluZyBhcm91bmQgd2l0aCBmb3IgYSB3aGlsZSBpcyB0
byByZXBsYWNlIHRoZQ0Kcm9vdCBQRCBmb3IgdGhlIFZNSURzIGluIHF1ZXN0aW9uIG9uIHRoZSBm
bHkuIEUuZy4gd2UganVzdCBsZXQgaXQgcG9pbnQNCnRvIHNvbWUgZHVtbXkgd2hpY2ggcmVkaXJl
Y3RzIGV2ZXJ5dGhpbmcgaW50byBuaXJ2YW5hLg0KDQpCdXQgaW1wbGVtZW50aW5nIHRoaXMgaXMg
ZWFzaWVyIHNhaWQgdGhhbiBkb25lLi4uDQoNCldhcm1pbmcgdXAgdGhpcyB0aHJlYWQsIHNpbmNl
IEkganVzdCBmaXhlZCBhbm90aGVyIGJ1ZyB0aGF0IHdhcyBlbmFibGVkIGJ5IGFydGlmaWNpYWwg
bWVtb3J5IHByZXNzdXJlIGR1ZSB0byB0aGUgR1RUIGxpbWl0Lg0KDQpJIHRoaW5rIGRpc2FibGlu
ZyB0aGUgUEQgZm9yIHRoZSBWTUlEcyBpcyBhIGdvb2QgaWRlYS4gQSBwcm9ibGVtIGlzIHRoYXQg
SFdTIGZpcm13YXJlIHVwZGF0ZXMgUEQgcG9pbnRlcnMgaW4gdGhlIGJhY2tncm91bmQgZm9yIGl0
cyBWTUlEcy4gU28gdGhpcyB3b3VsZCByZXF1aXJlIGEgcmVsaWFibGUgYW5kIGZhc3Qgd2F5IHRv
IGtpbGwgdGhlIEhXUyBmaXJzdC4NCg0KV2VsbCB3ZSBkb24ndCBuZWNlc3NhcnkgbmVlZCB0byBj
b21wbGV0ZWx5IGtpbGwgdGhlIEhXUy4gV2hhdCB3ZSBuZWVkIGlzIHRvIHN1c3BlbmQgaXQsIGtp
bGwgYSBzcGVjaWZpYyBwcm9jZXNzIGFuZCByZXN1bWUgaXQgbGF0ZXIgb24uDQoNCkFzIGZhciBh
cyBJIGNhbiBzZWUgdGhlIGNvbmNlcHQgd2l0aCB0aGUgSFdTIGludGVyYWN0aW9uIHdhcyB0byB1
c2UgYSByaW5nIGJ1ZmZlciB3aXRoIGFzeW5jIGZlZWRiYWNrIHdoZW4gc29tZXRoaW5nIGlzIGRv
bmUuDQoNClRoYXQgaXMgcmVhbGx5IGNvbnZlbmllbnQgZm9yIHBlcmZvcm1hdGl2ZSBhbmQgcmVs
aWFibGUgb3BlcmF0aW9uLCBidXQgdW5mb3J0dW5hdGVseSBub3QgaWYgeW91IG5lZWQgdG8ga2ls
bCBvZiBzb21lIHByb2Nlc3NpbmcgaW1tZWRpYXRlbHkuDQoNClNvIHNvbWV0aGluZyBsaWtlIHNl
dHRpbmcgYSBiaXQgaW4gYSByZWdpc3RlciB0byBzdXNwZW5kIHRoZSBIV1MsIGtpbGwgdGhlIFZN
SURzLCBzZXQgYSBmbGFnIGluIHRoZSBIV1MgcnVubGlzdCB0byBzdG9wIGl0IGZyb20gc2NoZWR1
bGluZyBhIHNwZWNpZmljIHByb2Nlc3Mgb25jZSBtb3JlIGFuZCB0aGVuIHJlc3VtZSB0aGUgSFdT
IGlzIHdoYXQgaXMgbmVlZGVkIGhlcmUuDQoNCg0KQW4gYWx0ZXJuYXRpdmUgSSB0aG91Z2h0IGFi
b3V0IGlzLCBkaXNhYmxpbmcgYnVzIGFjY2VzcyBhdCB0aGUgQklGIGxldmVsIGlmIHRoYXQncyBw
b3NzaWJsZSBzb21laG93LiBCYXNpY2FsbHkgd2Ugd291bGQgaW5zdGFudGFuZW91c2x5IGtpbGwg
YWxsIEdQVSBzeXN0ZW0gbWVtb3J5IGFjY2Vzcywgc2lnbmFsIGFsbCBmZW5jZXMgb3IganVzdCBy
ZW1vdmUgYWxsIGZlbmNlcyBmcm9tIGFsbCBCTyByZXNlcnZhdGlvbnMgKHJlc2VydmF0aW9uX29i
amVjdF9hZGRfZXhjbF9mZW5jZShyZXN2LCBOVUxMKSkgdG8gYWxsb3cgbWVtb3J5IHRvIGJlIGZy
ZWVkLCBsZXQgdGhlIE9PTSBraWxsZXIgZG8gaXRzIHRoaW5nLCBhbmQgd2hlbiB0aGUgZHVzdCBz
ZXR0bGVzLCByZXNldCB0aGUgR1BVLg0KDQpZZWFoLCB0aG91Z2h0IGFib3V0IHRoYXQgYXMgd2Vs
bC4gVGhlIHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgaXMgcmF0aGVyIGlu
dmFzaXZlLg0KDQpFLmcuIHN0b3BwaW5nIHRoZSBCSUYgbWVhbnMgc3RvcHBpbmcgaXQgZm9yIGV2
ZXJ5Ym9keSBhbmQgbm90IGp1c3QgdGhlIHByb2Nlc3Mgd2hpY2ggaXMgY3VycmVudGx5IGtpbGxl
ZCBhbmQgd2hlbiB3ZSByZXNldCB0aGUgR1BVIGl0IGlzIGFjdHVhbGx5IHF1aXRlIGxpa2VseSB0
aGF0IHdlIGxvc2UgdGhlIGNvbnRlbnQgb2YgVlJBTS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4N
Cg0KDQpSZWdhcmRzLA0KICBGZWxpeA0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQoNCg==

--_000_a8509b2a7299be82b784ec40a96a41d3amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <75EBFE5EF758E24F8FA97B06D8C292FC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5BbSAxMy4w
Ny4xOSB1bSAyMjoyNCBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOjxicj4NCjwvZGl2Pg0KPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjQ0NzQ3NTg2LThjOTgtNmM4NS1kYzVjLTc0NjRm
NTliMjA1ZUBnbWFpbC5jb20iPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5BbSAyMDE5
LTA0LTMwIHVtIDE6MDMgcC5tLiBzY2hyaWViIEtvZW5pZywgQ2hyaXN0aWFuOjxicj4NCjwvZGl2
Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOmY1YzY5OGFkLTJhZmYtYjNjNS0y
MDQxLTA1YTEwOTgzNDM4YUBhbWQuY29tIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxl
PSJjb2xvcjogIzAwMDAwMDsiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9ImNvbG9y
OiAjMDAwMDAwOyI+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoZSBvbmx5
IHJlYWwgc29sdXRpb24gSSBjYW4gc2VlIGlzIHRvIGJlIGFibGUgdG8gcmVsaWFibGUga2lsbCBz
aGFkZXJzDQppbiBhbiBPT00gc2l0dWF0aW9uLg0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPldlbGwsIHdlIGNhbiBpbiBmYWN0IHByZWVt
cHQgb3VyIGNvbXB1dGUgc2hhZGVycyB3aXRoIGxvdyBsYXRlbmN5Lg0KS2lsbGluZyBhIEtGRCBw
cm9jZXNzIHdpbGwgZG8gZXhhY3RseSB0aGF0Lg0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkkndmUgdGFrZW4gYSBsb29rIGF0IHRoYXQg
dGhpbmcgYXMgd2VsbCBhbmQgdG8gYmUgaG9uZXN0IGl0IGlzIG5vdCBldmVuIA0KcmVtb3RlbHkg
c3VmZmljaWVudC4NCg0KV2UgbmVlZCBzb21ldGhpbmcgd2hpY2ggc3RvcHMgdGhlIGhhcmR3YXJl
IDxiIGNsYXNzPSJtb3otdHh0LXN0YXIiPjxzcGFuIGNsYXNzPSJtb3otdHh0LXRhZyI+Kjwvc3Bh
bj5pbW1lZGlhdGVseTxzcGFuIGNsYXNzPSJtb3otdHh0LXRhZyI+Kjwvc3Bhbj48L2I+IGZyb20g
YWNjZXNzaW5nIA0Kc3lzdGVtIG1lbW9yeSwgYW5kIG5vdCB3YWl0IGZvciB0aGUgU1EgdG8ga2ls
bCBhbGwgd2F2ZXMsIGZsdXNoIGNhY2hlcyANCmV0Yy4uLg0KDQpPbmUgcG9zc2liaWxpdHkgSSdt
IHBsYXlpbmcgYXJvdW5kIHdpdGggZm9yIGEgd2hpbGUgaXMgdG8gcmVwbGFjZSB0aGUgDQpyb290
IFBEIGZvciB0aGUgVk1JRHMgaW4gcXVlc3Rpb24gb24gdGhlIGZseS4gRS5nLiB3ZSBqdXN0IGxl
dCBpdCBwb2ludCANCnRvIHNvbWUgZHVtbXkgd2hpY2ggcmVkaXJlY3RzIGV2ZXJ5dGhpbmcgaW50
byBuaXJ2YW5hLg0KDQpCdXQgaW1wbGVtZW50aW5nIHRoaXMgaXMgZWFzaWVyIHNhaWQgdGhhbiBk
b25lLi4uPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cD5XYXJtaW5nIHVwIHRoaXMgdGhyZWFkLCBz
aW5jZSBJIGp1c3QgZml4ZWQgYW5vdGhlciBidWcgdGhhdCB3YXMgZW5hYmxlZCBieSBhcnRpZmlj
aWFsIG1lbW9yeSBwcmVzc3VyZSBkdWUgdG8gdGhlIEdUVCBsaW1pdC48L3A+DQo8cD5JIHRoaW5r
IGRpc2FibGluZyB0aGUgUEQgZm9yIHRoZSBWTUlEcyBpcyBhIGdvb2QgaWRlYS4gQSBwcm9ibGVt
IGlzIHRoYXQgSFdTIGZpcm13YXJlIHVwZGF0ZXMgUEQgcG9pbnRlcnMgaW4gdGhlIGJhY2tncm91
bmQgZm9yIGl0cyBWTUlEcy4gU28gdGhpcyB3b3VsZCByZXF1aXJlIGEgcmVsaWFibGUgYW5kIGZh
c3Qgd2F5IHRvIGtpbGwgdGhlIEhXUyBmaXJzdC48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpX
ZWxsIHdlIGRvbid0IG5lY2Vzc2FyeSBuZWVkIHRvIGNvbXBsZXRlbHkga2lsbCB0aGUgSFdTLiBX
aGF0IHdlIG5lZWQgaXMgdG8gc3VzcGVuZCBpdCwga2lsbCBhIHNwZWNpZmljIHByb2Nlc3MgYW5k
IHJlc3VtZSBpdCBsYXRlciBvbi48YnI+DQo8YnI+DQpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBj
b25jZXB0IHdpdGggdGhlIEhXUyBpbnRlcmFjdGlvbiB3YXMgdG8gdXNlIGEgcmluZyBidWZmZXIg
d2l0aCBhc3luYyBmZWVkYmFjayB3aGVuIHNvbWV0aGluZyBpcyBkb25lLjxicj4NCjxicj4NClRo
YXQgaXMgcmVhbGx5IGNvbnZlbmllbnQgZm9yIHBlcmZvcm1hdGl2ZSBhbmQgcmVsaWFibGUgb3Bl
cmF0aW9uLCBidXQgdW5mb3J0dW5hdGVseSBub3QgaWYgeW91IG5lZWQgdG8ga2lsbCBvZiBzb21l
IHByb2Nlc3NpbmcgaW1tZWRpYXRlbHkuPGJyPg0KPGJyPg0KU28gc29tZXRoaW5nIGxpa2Ugc2V0
dGluZyBhIGJpdCBpbiBhIHJlZ2lzdGVyIHRvIHN1c3BlbmQgdGhlIEhXUywga2lsbCB0aGUgVk1J
RHMsIHNldCBhIGZsYWcgaW4gdGhlIEhXUyBydW5saXN0IHRvIHN0b3AgaXQgZnJvbSBzY2hlZHVs
aW5nIGEgc3BlY2lmaWMgcHJvY2VzcyBvbmNlIG1vcmUgYW5kIHRoZW4gcmVzdW1lIHRoZSBIV1Mg
aXMgd2hhdCBpcyBuZWVkZWQgaGVyZS48YnI+DQo8YnI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBjaXRlPSJtaWQ6NDQ3NDc1ODYtOGM5OC02Yzg1LWRjNWMtNzQ2NGY1OWIyMDVlQGdtYWlsLmNv
bSI+DQo8cD5BbiBhbHRlcm5hdGl2ZSBJIHRob3VnaHQgYWJvdXQgaXMsIGRpc2FibGluZyBidXMg
YWNjZXNzIGF0IHRoZSBCSUYgbGV2ZWwgaWYgdGhhdCdzIHBvc3NpYmxlIHNvbWVob3cuIEJhc2lj
YWxseSB3ZSB3b3VsZCBpbnN0YW50YW5lb3VzbHkga2lsbCBhbGwgR1BVIHN5c3RlbSBtZW1vcnkg
YWNjZXNzLCBzaWduYWwgYWxsIGZlbmNlcyBvciBqdXN0IHJlbW92ZSBhbGwgZmVuY2VzIGZyb20g
YWxsIEJPIHJlc2VydmF0aW9ucyAocmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9leGNsX2ZlbmNlKHJl
c3YsDQogTlVMTCkpIHRvIGFsbG93IG1lbW9yeSB0byBiZSBmcmVlZCwgbGV0IHRoZSBPT00ga2ls
bGVyIGRvIGl0cyB0aGluZywgYW5kIHdoZW4gdGhlIGR1c3Qgc2V0dGxlcywgcmVzZXQgdGhlIEdQ
VS48YnI+DQo8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpZZWFoLCB0aG91Z2h0IGFib3V0IHRo
YXQgYXMgd2VsbC4gVGhlIHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgaXMg
cmF0aGVyIGludmFzaXZlLjxicj4NCjxicj4NCkUuZy4gc3RvcHBpbmcgdGhlIEJJRiBtZWFucyBz
dG9wcGluZyBpdCBmb3IgZXZlcnlib2R5IGFuZCBub3QganVzdCB0aGUgcHJvY2VzcyB3aGljaCBp
cyBjdXJyZW50bHkga2lsbGVkIGFuZCB3aGVuIHdlIHJlc2V0IHRoZSBHUFUgaXQgaXMgYWN0dWFs
bHkgcXVpdGUgbGlrZWx5IHRoYXQgd2UgbG9zZSB0aGUgY29udGVudCBvZiBWUkFNLjxicj4NCjxi
cj4NClJlZ2FyZHMsPGJyPg0KQ2hyaXN0aWFuLjxicj4NCjxicj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiIGNpdGU9Im1pZDo0NDc0NzU4Ni04Yzk4LTZjODUtZGM1Yy03NDY0ZjU5YjIwNWVAZ21h
aWwuY29tIj4NCjxwPjwvcD4NCjxwPlJlZ2FyZHMsPGJyPg0KJm5ic3A7IEZlbGl4PGJyPg0KPC9w
Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOmY1YzY5OGFkLTJhZmYtYjNjNS0y
MDQxLTA1YTEwOTgzNDM4YUBhbWQuY29tIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdy
YXA9IiI+UmVnYXJkcywNCkNocmlzdGlhbi4NCjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9j
a3F1b3RlPg0KPGJyPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_a8509b2a7299be82b784ec40a96a41d3amdcom_--

--===============1232321141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1232321141==--
