Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0ED3810
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727506E3F9;
	Fri, 11 Oct 2019 03:52:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730057.outbound.protection.outlook.com [40.107.73.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0C96E3F9
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RimuDR5n3xHSgJ2aPEr5chj0YSuIDfQgsQ9xfTuYpKjKUKthJ3+li6HBruMqMGR+25yxtexfSPjjznotsN3RX/ARUlf05/sXQd466UftqfP4XLtONmOCsFoXWgGB5eNHrR4tUEPUvG85+GRGRh7dRoTc5LTb+7+XulXFS/DIE/T0z5MB5KZx8FlFLPqhZkH737MN+Ok96VP8X4dJh0EZQLMheBAY2QuzP4rcH1Ycw5LwHiEqcPMFD0MGUBb1kAZfCaR5KovG4Iv+0By/6/uHIHm/qb63OJm9GOqAgZL8FiyEu/3LgQmvMlHF9y5M2p8BFqTVJ02Gv+yRjVYNyhB8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUU7/zUCS/NdHilQVI1gWh1b8m2nAHKlya7lZv35hO8=;
 b=UPwJ5hvBmsziCWWLdnlG7yJVjAlc5G5to4E/SLYcA03tZx6R7rdmSG2q2chNGaNAUeeKjnHlYN2D5Y7YJbEQPHmVxvEcCJdOlss0/cuxLQLc6Z+DO2FKZqbsvtSsf5dAVkLCDpKtyMnXCWjf9IJOIItWGIB2YjsiUHsLXH9Jos+JGcPYfVJPqoJ60LzfTxNVFXkjl3gCGnrv1MHK5kviwS/+scpt8BoaMdoocBytzBVo9H0J/HQMGmy38lU2pPs/S4dxTM5Cvcp07oWxYD6V9NSsr6EqMY5PvRf4rG5aPtWvPQmSpjAmaGZJDxUcSUoZbtmyFPC5KwDe4LskrTHo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1337.namprd12.prod.outlook.com (10.168.234.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Fri, 11 Oct 2019 03:52:30 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede%9]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 03:52:30 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Li, Dennis" <Dennis.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>
Subject: RE: [PATCH 0/3] RAS Support for GFX blocks
Thread-Topic: [PATCH 0/3] RAS Support for GFX blocks
Thread-Index: AQHVf96JEYJooUbiUkqur+KnYPwXMadUzrNA
Date: Fri, 11 Oct 2019 03:52:30 +0000
Message-ID: <DM5PR12MB14189C1B342B9054D5F8B451FC970@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20191011024922.9018-1-Dennis.Li@amd.com>
In-Reply-To: <20191011024922.9018-1-Dennis.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47a9ac63-85f4-4315-9333-08d74dfe7107
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1337DA5AE7F8F43C663C908CFC970@DM5PR12MB1337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(13464003)(66556008)(7696005)(3846002)(14454004)(2906002)(64756008)(6116002)(476003)(11346002)(446003)(26005)(305945005)(66066001)(76176011)(256004)(74316002)(99286004)(316002)(66946007)(4744005)(478600001)(186003)(66446008)(53546011)(7736002)(66476007)(86362001)(6506007)(6246003)(76116006)(8936002)(81156014)(4326008)(81166006)(25786009)(2501003)(71190400001)(8676002)(229853002)(486006)(33656002)(71200400001)(52536014)(102836004)(9686003)(55016002)(5660300002)(6436002)(6636002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1337;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +gjrOIpzjZMNgaPygGfNx7Q2tbhTxXxmT8yBnynTWhYpU8/81wpewRXJN3yJgc82kGytj+NFVeDIuY0cmmY6WYU99bVuJr1mhm5RJw1NtByH5xPYQ/NkgXlUs/rTEbYmdRbicHLsH/fhbmYvU27TziZCkM/5ZVHD81DW8rIKEu0+M4nNZUC0gJPBb5jPPu4psxvEjDXIJQdaiFo279P4l0OeUwgYvALBCgRR5BDLFny4WTeBVmuLaWOEFqiPy5lAIoscVk5jo7CcT/VYrqL8Ureh1Kk8U2ZQcsbgGRedrU4RrvaivuOoJANeY9fmreM+xJ7c6cXqfcakgLU21AJ/GrmekPf3q2tTp2p+f/ON/0/TQ5SSHg1kOtOJFZyW6NH4y0ocLE90hb/2uqS6CFFW3x/+kyHP5w1T48Qw0p3PTlo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a9ac63-85f4-4315-9333-08d74dfe7107
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 03:52:30.8288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwAfFtZJXEaI00gPSqr+P3hqfhmNny2RGF3aIM7RoIxW1nZ/QYyGe4A7UpUHFshFcFjMFNms4pTqMs4bPvpQGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUU7/zUCS/NdHilQVI1gWh1b8m2nAHKlya7lZv35hO8=;
 b=hH1FYQvtB6u+JXJAETrzaaIzk9ZbUID+6I6+eFXkXYRykbMpsztL31KhSb3dnug/6cNKmyS8vt/YZsOgjZUttvyuEwBD+MTDyN2unJvj06qcqTLBq6p9ipR0NdTV6kuFyyvJ6qk4iRmwPfntCGStsHRS1y/GhyyHY97sbZk8yDM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Li, Dennis" <Dennis.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQoNClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0MTDmnIgx
MeaXpSAxMDo0OQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhv
dTFAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBDaGVu
LCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQpDYzogTGksIERlbm5pcyA8RGVubmlzLkxp
QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSBSQVMgU3VwcG9ydCBmb3IgR0ZYIGJsb2Nr
cw0KDQoxLiBBZGQgdGhlIEVEQyBjb3VudCBmcm9tIGhhcmR3YXJlLg0KMi4gQWRkIFJBUyBzdXBw
b3J0IGZvciBWTUwyIGFtZCBBVENMMiBzdWIgYmxvY2tzLg0KDQpEZW5uaXMgTGkgKDMpOg0KICBk
cm0vYW1kZ3B1OiBjaGFuZ2UgdG8gcXVlcnkgdGhlIGFjdHVhbCBFREMgY291bnRlcg0KICBkcm0v
YW1kL2luY2x1ZGU6IGFkZCByZWdpc3RlciBkZWZpbmUgZm9yIFZNTDIgYW5kIEFUQ0wyDQogIGRy
bS9hbWRncHU6IGFkZCBSQVMgc3VwcG9ydCBmb3IgVk1MMiBhbmQgQVRDTDINCg0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgICAgICB8IDk4NiArKysrKysrKysrKyst
LS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5oICAgICAgICAgICAgfCAg
IDIgKw0KIC4uLi9hbWQvaW5jbHVkZS9hc2ljX3JlZy9nYy9nY185XzBfb2Zmc2V0LmggICB8ICAx
OCArLQ0KIC4uLi9hbWQvaW5jbHVkZS9hc2ljX3JlZy9nYy9nY185XzBfc2hfbWFzay5oICB8ICAx
OCArLQ0KIDQgZmlsZXMgY2hhbmdlZCwgNjk1IGluc2VydGlvbnMoKyksIDMyOSBkZWxldGlvbnMo
LSkNCg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
