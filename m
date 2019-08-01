Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95EA7D704
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 10:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19D6E3CE;
	Thu,  1 Aug 2019 08:14:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A756E3C7
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 08:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUPMXlrE5kvmDXY3NflEGPYbANS/Bl9+UcG3hw8E8G4g0Cx+p1Tx4woCdriv0l+V1ePGQRvVC59pXKBn43sRUHDyXd6bvSMa+TchGj3qmFS8kWFTUIzetW62zvuAQPsk7NGEFuwv2JZF0YpYbWCS02fKo83GY9sePYy3iNGHebvI+Zi/OLMnjwIzaioNNlZ+amh0i1/BSe/R5z2XydZKdRwBSr2i7YspTyY1CmZLiVHTZn99hvLeZGv91o/9Mnck9CkA7am3903N5TH4LPq4W7NPYDk3ExxfG7DMazbU+55rth3Zq5kJt/tYE5ee6KT9Z9Ue4SjqusiomvL8NycX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNgdtTJxH6SWNhpCLYL+pjswAsjZt9YBrzbqGJ1KCYU=;
 b=asXe8AFzrC1N2i0fid50hL62b4tW04m0XR13axA+GfGZEhuMiWC72+/g+y02oAWzmfKmuvxy0D+F8YYZXOldfHqni/C5agQkNdTOY1cGKbyyAlIS/GmyO8cHsighfz4qiA09TyMcly/H2YRhtf/G6q4QG0HVuhEn+khnJ/Avkiq7M4r7mcV8U7a2RllRVVSEcu7U6wAuV9+Uqu4wB5YqxQby5G73/OlA/fuMTPK+wOlvjFCdjVLjCxYLvU2GgEwkPIq6WlXVoA0IeTtTGjKCK3RLVjDvF9YWS++0E+T8qdQ0y1kjvq9D3TJ5UP2BX82yhyfPnG0MNdIHjMNze7yJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3453.namprd12.prod.outlook.com (20.178.240.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Thu, 1 Aug 2019 08:14:12 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 08:14:12 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Chen, 
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/4] enable umc ras ce interrupt
Thread-Topic: [PATCH 0/4] enable umc ras ce interrupt
Thread-Index: AQHVSDXydkhwrzGT30ayNXLI+OvQNKbl67IAgAAC81A=
Date: Thu, 1 Aug 2019 08:14:12 +0000
Message-ID: <MN2PR12MB30546488B858829762157EFFB0DE0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
 <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8661f61a-53bb-4571-8d8a-08d716583cb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3453; 
x-ms-traffictypediagnostic: MN2PR12MB3453:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3453108BF093109A91943343B0DE0@MN2PR12MB3453.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(13464003)(189003)(199004)(25786009)(6306002)(55016002)(478600001)(66476007)(9686003)(66446008)(316002)(6116002)(66066001)(99286004)(33656002)(64756008)(71190400001)(71200400001)(66946007)(66556008)(5660300002)(76116006)(6246003)(7696005)(229853002)(7736002)(6436002)(110136005)(76176011)(6636002)(53546011)(446003)(966005)(6506007)(8676002)(305945005)(2501003)(102836004)(486006)(53936002)(68736007)(476003)(81156014)(81166006)(2906002)(3846002)(86362001)(11346002)(52536014)(74316002)(14454004)(14444005)(8936002)(256004)(26005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3453;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tf2oGVn1mbwzsXTpLoDzRANI3Cj18/VGWuZirmXlBagz8afe3ZdDOTNsKDn0UN0FU8l/p43xoehdZ6A5ndixetq6GkcQmXdHkwB3kILF61GoW+xhu6D7e4jDwJ8ikc0YA6VKAHdj7hc2RwK2rTo2/ELFbRuWDibeR+v0tFd4AJvAI4HWROE2LnokzZV/CJs5BXxFtGYngFTn8Eq1HcbBTXeEY8HrwM63avA8qb/0i2975u2GTA75f67g1TO4Ahwv7vYNjUQRAiDXp8fyftxL0hMf67UMBLFR85GcK2JdCdT6Ux7mBnXMHVCpxIL4AvCBQD1O14v54MHhNaIK1TPvNKKFOH4VDScqPDTmchH0hSi7t/j3hkdNJlayVAeLzd/9xvjLouyQU6d1Ksi1GdMGW4vin795lWaRleSniMGxTL8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8661f61a-53bb-4571-8d8a-08d716583cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 08:14:12.7331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tazhou1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3453
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNgdtTJxH6SWNhpCLYL+pjswAsjZt9YBrzbqGJ1KCYU=;
 b=nnWm+VKZj3NddYaY0nsROq+9yQnm/Bi0313Pv6UovOcrN61pQg3NFnwpE4TDyONw0tN8i4ICVQTOtLWPydKJGm76z8w29At/qfNjNO/8vjExfWa4ozpnYSfLiL6lDePVl2gb1ezWIChI/5WeOmCGjO2cLNUZ2jallL0gG241GRM=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RWNjRXJySW50IGZpZWxkIG9mIEVjY0VyckNudFNlbCBzcGVjaWZpZXMgdGhlIHR5cGUgb2YgaW50
ZXJydXB0LCBpdCdzIG5vdCB0aHJlc2hvbGQuIEJ1dCBteSBjb21tZW50IGZvciB0aGUgY29kZSBp
cyBub3QgcHJvcGVyLCBJJ2xsIHVwZGF0ZSB0aGUgY29tbWVudC4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPg0KPiBTZW50OiAyMDE55bm0OOaciDHml6UgMTU6NTINCj4gVG86IFpob3UxLCBUYW8gPFRh
by5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExpLA0KPiBE
ZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQu
Y29tPjsNCj4gUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCj4gQ2M6IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDAvNF0gZW5hYmxl
IHVtYyByYXMgY2UgaW50ZXJydXB0DQo+IA0KPiAxLikgUGxlYXNlIGZpeCB0aGUgdHlwbyBpbiBw
YXRjaCAjMiBkZXNjcmlwdGlvbjogZWMgLS0+IGNlIDIpLiBQYXRjaCAjMg0KPiANCj4gKwllY2Nf
ZXJyX2NudF9zZWwgPSBSRUdfU0VUX0ZJRUxEKGVjY19lcnJfY250X3NlbCwNCj4gVU1DQ0gwXzBf
RWNjRXJyQ250U2VsLA0KPiArCQkJCQlFY2NFcnJJbnQsIDB4MSk7DQo+IEZvciB0aGUgRWNjRXJy
SW50IGZpZWxkLCBpdCBzaG91bGQgYmUgcHJvZ3JhbWVkIHRvIGJlIChNQVggLSBJTklUKSwgY29y
cmVjdD8NCj4gYnV0IHRoZSBoYXJkY29kZWQgdmFsdWUgc2VlbXMgbm90IG1hdGNoIHdpdGggdGhl
IHZhbHVlIGNhbGN1bGF0ZWQgYnkgdGhvc2UNCj4gbWFjcm8uDQo+IA0KPiBSZWdhcmRzLA0KPiBI
YXdraW5nDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFt
ZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBUYW8NCj4g
WmhvdQ0KPiBTZW50OiAyMDE55bm0OOaciDHml6UgMTQ6NTQNCj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBDaGVuLA0KPiBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KPiBDYzog
WmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAwLzRdIGVu
YWJsZSB1bWMgcmFzIGNlIGludGVycnVwdA0KPiANCj4gVGhlc2UgcGF0Y2hlcyBhZGQgc3VwcG9y
dCBmb3IgdW1jIGNlIGludGVycnVwdCwgdGhlIGludGVycnVwdCBpcyBjb250cm9sbGVkDQo+IGJ5
IGEgZXJyb3IgY291bnQgdGhyZXNob2xkLg0KPiANCj4gVGFvIFpob3UgKDQpOg0KPiAgIGRybS9h
bWRncHU6IHN1cHBvcnQgY2UgaW50ZXJydXB0IGluIHJhcyBtb2R1bGUNCj4gICBkcm0vYW1kZ3B1
OiBpbXBsZW1lbnQgdW1jIHJhcyBpbml0IGZ1bmN0aW9uDQo+ICAgZHJtL2FtZGdwdTogdXBkYXRl
IHRoZSBjYWxjIGFsZ29yaXRobSBvZiB1bWMgZWNjIGVycm9yIGNvdW50DQo+ICAgZHJtL2FtZGdw
dTogb25seSB1bmNvcnJlY3RhYmxlIGVycm9yIG5lZWRzIGdwdSByZXNldA0KPiANCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDEyICsrKystLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8ICA2ICsrKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDQyDQo+ICsrKysrKysrKysrKysrKysr
KysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggICB8ICA3
ICsrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
