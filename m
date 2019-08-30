Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E6A3775
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416E66E331;
	Fri, 30 Aug 2019 13:01:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8556E331
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 13:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZUzQozM8Txjd8FMR/JWYDu5y0iTYGilJmZ0ykI+QStP7PwK9IPWEYtuAuKeGRM6ES/WMnC5kZVR/Pbxd7y6gpCPuSXVDYVqX0zIzwyaiav2x+u2UZi1LstnaZeoEjiBcvkUwhLccXrNsBWA4f1P24uZKAxMm6mMnhCEOpyBkXuIL/A3prgKDxcAD9c9+B6csKex4pvsT3pnZwDEufkVzEh5E8aUNLqs4YFogFLwqSFzSttu/3ZHnxOw70iA+f29Az3d+yFJQyRi+yQBC5kHDhzD4hJvmZKgrjzfA+oKxPlRir7k3CXA8PVveFpemlTXDP9FbuKMGFI5/fUjC1k+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV+IWy81ziD0ngWvJErCRLlep730x/OL5/udS+B6xKY=;
 b=DPeWJXOnNnIE2rgRFrP6ukFUUQ/efuzYSNELpOtWtY8E93/l4dlhikQwzfucXiHFZsfwzX3Vy526191a8v177UbyT8bWBiJCqJKg5OQMBREhOBt1VEY2hJ8LH66t8n1CMxVvI1B36bfKFQ1nXtFT+V9+QC/2embXVnmAN5Mhi1c3Z3f+h0vfQj6qh0yRbV6UmheBoQiA+O7+8qG+XihJiWgZFs+uiU/nmuVuxYb+aEVnV+ktTi2MimbrQe9keJB3JB3t3Z4YhwPmtooYDu9ofyY0vBTmwEISn4Wrh5thorIk5YYKa8NomUyyKwFHgdzTmC2hYlMijcHspLFXx4GBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 13:01:18 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 13:01:18 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: fix no interrupt issue for renoir emu (v2)
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix no interrupt issue for renoir emu
 (v2)
Thread-Index: AQHVXvTJVyM7fQXW0Eusnt/iUbLNJacTp77w
Date: Fri, 30 Aug 2019 13:01:18 +0000
Message-ID: <MN2PR12MB33090DC74864105A24DD7932ECBD0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1567143195-22090-1-git-send-email-aaron.liu@amd.com>
 <1567143195-22090-2-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567143195-22090-2-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.27.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 730f93f8-e6a9-4c8f-f545-08d72d4a262f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3949; 
x-ms-traffictypediagnostic: MN2PR12MB3949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB394925973C9E0EB679F34F0BECBD0@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(13464003)(4744005)(71190400001)(3846002)(52536014)(64756008)(76116006)(66476007)(33656002)(14444005)(256004)(5660300002)(14454004)(66446008)(478600001)(102836004)(66066001)(6506007)(53546011)(26005)(186003)(71200400001)(11346002)(25786009)(316002)(476003)(54906003)(110136005)(229853002)(7696005)(66946007)(76176011)(66556008)(99286004)(9686003)(8936002)(86362001)(7736002)(74316002)(81166006)(81156014)(8676002)(2501003)(305945005)(55016002)(53936002)(6436002)(446003)(486006)(2906002)(4326008)(6116002)(6246003)(79990200002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3949;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +8j9vehZJxmndK6E98Lcdp08uGNKLJpCT4IN+b4mW58v9o7ooD5Cr2I+bWS4qHNKXucsbCQdFlE7VwpVwSCi3dCC2q9EICxc55BrkmT9DV84c2iZX39EklskWR58k4MkICnX705LnFo/IjiF2OoOE0nAPZw6nYY9uXq0I436Lm9ZQ/pmQ1nzriIGdDwqh8h4CGOliylyEBasyuWZTnNRXlhhP891QUUAG0xZ1wdryANFqWbZ0KK1QCU4e607tVl/IIHnNTHdZr12hPf6ZYWkOFWOmqnXGVWUpMOLrEEyH5LozUTeGFaFCGB863Dics40n96GIN45r4E2zgkQoN9hZnsl0lsMwuZwyCo+AeHHLj3bVKpZM/50ViaNxYOwHzkPA+DWYE6e9XdygfjsS7xCGTN9DK2o5Ysztz7nHDrNRA7KPFGJ3Pmfni6TNVR/wOsahmFA68bId1F7Pkf8ZARcnQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730f93f8-e6a9-4c8f-f545-08d72d4a262f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 13:01:18.7041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEBmPmAPceOeixX+0+YkTI6AKg+UNyBLN4AYIHI87IzriUw9eeuJGInNywWRPYmqRdADL7SAWaFMpKigF8ebdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV+IWy81ziD0ngWvJErCRLlep730x/OL5/udS+B6xKY=;
 b=d+0K6bkRnUYgxNOBbEJ4jtoHDm91AdLZPHPAzCh0M9FrIFhW4p7savATwveGJMGgXdWPVbnkAtZ3p1ZIsEeLm76PVTSh0Pawv/q9vuaJNQuKy8kJuYEM68HaSnQYOEoBAEtvMm7Zhl5r0NPiqB4wXuXrona6osQsUFx3eyOHoQ4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2hlcyBhcmUgQWNrZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNClBs
ZWFzZSB1c2UgImdpdCBzZW5kLWVtYWlsIiBvbiBhbWQtZ2Z4IHB1YmxpYyBjb2RlIHJldmlldy4N
Cg0KVGhhbmtzLA0KUmF5DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBYXJv
biBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPiANClNlbnQ6IEZyaWRheSwgQXVndXN0IDMwLCAyMDE5
IDE6MzMgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1QGFtZC5jb20+OyBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8y
XSBkcm0vYW1kZ3B1OiBmaXggbm8gaW50ZXJydXB0IGlzc3VlIGZvciByZW5vaXIgZW11ICh2MikN
Cg0KDQpJbiByZW5vaXIncyB2ZWdhMTBfaWggbW9kZWwsIHRoZXJlJ3MgYSBzZWN1cml0eSBjaGFu
Z2UgaW4gbW1JSF9DSElDS0VOIHJlZ2lzdGVyLCB0aGF0IGxpbWl0cyBJSCB0byB1c2UgcGh5c2lj
YWwgYWRkcmVzcyAoRkJQQSwgR1BBKSBkaXJlY3RseS4NClRob3NlIGNoaWNrZW4gYml0cyBuZWVk
IHRvIGJlIHByb2dyYW1tZWQgZmlyc3QuDQoNClNpZ25lZC1vZmYtYnk6IEFhcm9uIExpdSA8YWFy
b24ubGl1QGFtZC5jb20+DQpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpB
Y2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMgfCAxOCArKysrKysrKysrLS0t
LS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
