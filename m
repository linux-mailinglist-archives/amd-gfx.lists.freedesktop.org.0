Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B186F42
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 03:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32A76ECE7;
	Fri,  9 Aug 2019 01:25:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5159C6ECE7
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 01:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9AVSEAYeOrxyVDEsPMt+RpmaMLDx7GTqt1fxFreFd7HqzRwy+q5pc3G3OaSoFlP/EqZdT0S5iXtzw+rLIv3RAQW6flurmIL7YbeXtgvwvYf64LX9KB4MpOF/FR6avr0xL00u9kMvxBEh74dBBi0+UO/S7+As2/haSzEk65Zdqxh9ddecrkEIgLvAu31/drPdTYMp6Pp+O65G5EkdQA8qgXo62GXb8LgZwOXM7c6bDhd1B5dgQZRelCjcdY05XQ1YnZuJTnhbwAKL0hRXsld0S58KBmLkgbNd7dBoTcRVHkUBGbsS2FwQOXa1BoWyFMf1c2QoUe8yj6bMq4s7aO8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Shns2XG9UqmYVFf8xVDfaDIjfmAVMZgB0uUKHM0jHY=;
 b=bnlggMnKRTIeNH2IOdJrA1eueET+Hpf0otvkUqbQZsHk1NwFz4NmSTJmDHV5eQgQ3lSDeX8xlrcM7zVL3mJRscindjzmv70QhcI0lsCUGU4ltpgv6ss+6us3c3gyQV4YI1RMg2l7Ze0/EkhGlSq2CI0t9eA7k+mxd8sDWq+4vIJhZ/ydc6AQy5y598jRapy+TiMWt3tkGEk3KnE78yLzPTjEaI5KLJdJIc0j9b62Esmx4lHK6ooOf4fqBl5zaWA905HF7o85fZaRAdlQPs4xt5T26BkKiSMAmqvgOCjmupb+Hys+8l0YM/B7p6Fq4GjFFZ9p731kPwEaHbZyfRtisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2714.namprd12.prod.outlook.com (20.176.116.87) by
 DM6PR12MB4170.namprd12.prod.outlook.com (10.141.186.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 9 Aug 2019 01:25:40 +0000
Received: from DM6PR12MB2714.namprd12.prod.outlook.com
 ([fe80::d81a:5be6:7656:6ae9]) by DM6PR12MB2714.namprd12.prod.outlook.com
 ([fe80::d81a:5be6:7656:6ae9%3]) with mapi id 15.20.2094.017; Fri, 9 Aug 2019
 01:25:40 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVNybWC+tQHNTX/QmCty/NITmdI3AARE8KAABDQ6NA=
Date: Fri, 9 Aug 2019 01:25:40 +0000
Message-ID: <DM6PR12MB27141A339F87664639DB5F9BF1D60@DM6PR12MB2714.namprd12.prod.outlook.com>
References: <BYAPR12MB27097A9CC4333FD798966B30F1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
 <CADnq5_N5TrBKCH_S+=eDXxQQ-VwEvONn1aGyicSrL3B38BJhSA@mail.gmail.com>
In-Reply-To: <CADnq5_N5TrBKCH_S+=eDXxQQ-VwEvONn1aGyicSrL3B38BJhSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.171.71.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0f876c7-d19a-4f97-d1ba-08d71c687dbe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4170; 
x-ms-traffictypediagnostic: DM6PR12MB4170:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB41707CCF9401CE4DC6668E61F1D60@DM6PR12MB4170.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(189003)(199004)(13464003)(8936002)(53936002)(86362001)(81156014)(8676002)(6436002)(71190400001)(81166006)(74316002)(4326008)(6916009)(229853002)(4744005)(66946007)(66446008)(7736002)(66476007)(305945005)(316002)(6246003)(76116006)(64756008)(26005)(102836004)(6506007)(66556008)(33656002)(186003)(53546011)(76176011)(1411001)(3480700005)(7696005)(476003)(446003)(486006)(11346002)(54906003)(14454004)(9686003)(71200400001)(55016002)(5024004)(5660300002)(66066001)(6306002)(2906002)(14444005)(966005)(25786009)(478600001)(99286004)(3846002)(6116002)(52536014)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4170;
 H:DM6PR12MB2714.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AhQgFl4FNtG9Cb+9CPtprTSFzhf1bsWVgy8cq4H2KH+Sb8mk+j7QFyYlLpf0DrIN/MOp/jE8bmtzCZ/mBy9fc8H4AajHy2kRO9OiACKFVYv3xm+6eADqwZtQ/SCJhGcpa2l35HqRnAVhNquW3KPbjib4bUDI25AOBbDuTvTidMDiboKTHZYnaMnF/jNVDFsRNRMMqZ2YAMOD2K2wsbgl7z/TBRLbsfQipHFAaxcmLjqS+spG8LCDOEn1YmXp6x5CxO0ojfUvsu+7i5xjDKHvuF4B8vlfbRIknMZn4ZLR82b46XLnexRfTg/mXSZMF5XN4h0cCj5fYm+boIwAK1+J6Yn13Vl0/CevWKzkLZ+LUVe0fIZHjhiLbTdzbk0rwYH1VuVN+eqDxSKZZa40gSg8tZuDGdoRVYUchgKGFgW7te0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f876c7-d19a-4f97-d1ba-08d71c687dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 01:25:40.6859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guchchen@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Shns2XG9UqmYVFf8xVDfaDIjfmAVMZgB0uUKHM0jHY=;
 b=iYL+pEIhe0oPXUDzff+yKM76ncukQ0M8owEvMLfnndz8X8PdyHW0j/pu2fdrREjvCkKTKBxAXp/i2mJK+3cB4qf9LBG6dStbyFc/lAHzf02UpThnwgQ39q4Ks0TPLO1eGt+GtWt4lx3SPMKPv0aO4ohoZZ1nVwMwQ0Auux9Tea8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Candice" <Candice.Li@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzLCBBbGV4Lg0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gDQpTZW50
OiBGcmlkYXksIEF1Z3VzdCA5LCAyMDE5IDE6MjQgQU0NClRvOiBDaGVuLCBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+DQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpob3UxLCBUYW8gPFRh
by5aaG91MUBhbWQuY29tPjsgTGksIENhbmRpY2UgPENhbmRpY2UuTGlAYW1kLmNvbT47IExpLCBE
ZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4NClN1YmplY3Q6IFJlOiBsaWJkcm0gcGF0Y2ggbWVyZ2UgcmVxdWVzdA0KDQpEb25l
IQ0KDQpBbGV4DQoNCk9uIFRodSwgQXVnIDgsIDIwMTkgYXQgNToxOCBBTSBDaGVuLCBHdWNodW4g
PEd1Y2h1bi5DaGVuQGFtZC5jb20+IHdyb3RlOg0KPg0KPiBIaSBBbGV4LA0KPg0KPg0KPg0KPiBX
b3VsZCB5b3UgbWluZCBtZXJnaW5nIGF0dGFjaGVkIDMgcGF0Y2hlcyB0byBsaWJkcm0gbWFzdGVy
IGJyYW5jaD8NCj4NCj4gVGhlc2UgY2hhbmdlcyBhcmUgaW1wbGVtZW50ZWQgZm9yIGdmeCBhbmQg
dW1jIHJhcyBpbmplY3QgdW5pdCB0ZXN0IGJ5IGFtZGdwdV90ZXN0Lg0KPg0KPiBUaGFua3MgYSBs
b3QuDQo+DQo+DQo+DQo+IFJlZ2FyZHMsDQo+DQo+IEd1Y2h1bg0KPg0KPg0KPg0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
