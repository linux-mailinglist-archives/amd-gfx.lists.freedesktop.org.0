Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FE15FD7
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC75A89F82;
	Tue,  7 May 2019 08:54:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3C89F77
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:54:52 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3165.namprd12.prod.outlook.com (20.179.81.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 08:54:51 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 08:54:51 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
Thread-Topic: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
Thread-Index: AQHVBIqT3dm+73E6xUabPl0IXPMV0qZfRiaAgAACGvA=
Date: Tue, 7 May 2019 08:54:51 +0000
Message-ID: <MN2PR12MB34084FE909CDC9AF45A6D624FE310@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
 <1b5b40b0-0d3c-8374-f423-5c50617fca9a@gmail.com>
In-Reply-To: <1b5b40b0-0d3c-8374-f423-5c50617fca9a@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f99b8fdd-a90c-4af5-44c8-08d6d2c9aab6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3165; 
x-ms-traffictypediagnostic: MN2PR12MB3165:
x-microsoft-antispam-prvs: <MN2PR12MB3165835C1619EAE85EA566E1FE310@MN2PR12MB3165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(376002)(346002)(396003)(13464003)(189003)(199004)(110136005)(52536014)(14444005)(99286004)(33656002)(76176011)(7696005)(256004)(68736007)(2501003)(26005)(7736002)(66066001)(74316002)(102836004)(6436002)(186003)(229853002)(53546011)(55016002)(305945005)(6506007)(476003)(486006)(446003)(11346002)(478600001)(53936002)(72206003)(6246003)(6116002)(66574012)(14454004)(5660300002)(9686003)(71200400001)(2906002)(71190400001)(81166006)(8936002)(66476007)(8676002)(81156014)(66556008)(64756008)(66446008)(86362001)(73956011)(66946007)(25786009)(316002)(3846002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3165;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a3HBCzpP1iyvkqpTqG/B4nu6Cw4cSRfmZ1GWQH0SWcFPHJ+ytZFKo5hy4aFmcGur0zacxG+h4PHFNdmqMI/8jfW4vKMvZRTSuNJKla2Q5uzKk23jaUY63MCdQQuCQCNphUlO0FZT+WZXCHdxsCvoNRX8NSj9a1onytb8oHdiMsP7H6CjivBnuS9C8dZhAnh5LhyJOMQAAMvuPyaYrvg/a+ACgn9xzJBSjziIehZmB0zd2b+Cr0SXSpX2lmMJKb23UnuAcNCxQiQCU+uFgUCubkOfvf/MATFMHyjSHjt2hyJ1+nismvs6sxUrseHGbj8T0s/tUy/p4aIy1lYNcmS2k3AkDTKDZukqY4drQ5mI9VuUvWxOU27IG4D4krbnFtqjdZVcawSIS2rWze8mP/i7Kj18k7sO+WGaHvKmlVDm8Ww=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99b8fdd-a90c-4af5-44c8-08d6d2c9aab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 08:54:51.3284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhp3IjHB0ZGrTSZJTBLP00zkqEoGGdqZO+JD24MhnYI=;
 b=gZAtmEpG7ykRbF9O9wgwtjmz116A81qWgDvL8MaFItbZgF/dTz6AKgPlZTCAl4HZS+Ur+YDzHIpJzywUXqwAmziZDb0TJao3hZnhpi6Xje+1lWVhQYAXzz5WLIU5Aoyida8fLdWcsjr/MFHUJd4TYYj3LUaDxqVaKohvxwMjB1g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KDQpPbiBWZWdhMTAgU1ItSU9WIFZGLCBJIGluamVjdGVkIGEgJ3JlYWwn
IFZNQyBwYWdlIGZhdWx0IGZyb20gdXNlciBzcGFjZSwgdXNpbmcgdGhlIG1vZGlmaWVkIGFtZGdw
dV90ZXN0Lg0KWyAgIDE5LjEyNzg3NF0gYW1kZ3B1IDAwMDA6MDA6MDguMDogW2dmeGh1Yl0gbm8t
cmV0cnkgcGFnZSBmYXVsdCAoc3JjX2lkOjAgcmluZzoxNzQgdm1pZDoxIHBhc2lkOjMyNzY4LCBm
b3IgcHJvY2VzcyBhbWRncHVfdGVzdCBwaWQgMTA3MSB0aHJlYWQgYW1kZ3B1X3Rlc3QgcGlkIDEw
NzEpDQpbICAgMTkuMTMwMDM3XSBhbWRncHUgMDAwMDowMDowOC4wOiAgIGluIHBhZ2Ugc3RhcnRp
bmcgYXQgYWRkcmVzcyAweDAwMDAwMDA4MDAwMDAwMDAgZnJvbSAyNw0KDQpBbmQgc2VlIHRoaXMg
aW50ZXJydXB0IGlzIHN0aWxsIGZyb20gSUgwIGFtZGdwdV9pcnFfaGFuZGxlciwgd2hpY2ggY2Fu
IHByb3ZlIHRoaXMgZmVhdHVyZSBpcyBub3Qgd29ya2luZyB1bmRlciBTUi1JT1YuDQoNCkkgc3Vn
Z2VzdCB0byByZW1vdmUgdGhpcyBmZWF0dXJlIGZyb20gU1ItSU9WLCBhcyBteSBjb25jZXJuIGlz
LCAgc29tZSB3ZWlyZCBidWdzIG1heSBiZSBjYXNlZCBieSBpdCBpbiB0aGUgVmlydHVhbGl6YXRp
b24gaGVhdnkgc3RyZXNzIHRlc3QuDQpJbiB0aGUgZnV0dXJlLCBtYXliZSB3ZSBjYW4gcmVxdWVz
dCBQU1AgdGVhbSB0byBhZGQgdGhpcyBzdXBwb3J0IGZvciBTUi1JT1YuDQoNClRoYW5rcyAmIEJl
c3QgV2lzaGVzLA0KVHJpZ2dlciBIdWFuZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
IA0KU2VudDogVHVlc2RheSwgTWF5IDA3LCAyMDE5IDM6MzcgUE0NClRvOiBIdWFuZywgVHJpZ2dl
ciA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
ClN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8yXSBTa2lwIElIIHJlLXJvdXRlIG9uIFZlZ2EgU1ItSU9W
DQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KV2UgaW50ZW50aW9uYWxseSBkaWRuJ3Qg
ZG8gdGhpcyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgY29tbWFuZHMgYXJlIGlnbm9yZWQgYnkgdGhl
IFBTUCBmaXJtd2FyZS4NCg0KSSBoYXZlIG5vIHN0cm9uZyBvcGluaW9uIG9uIGlmIHdlIHNob3Vs
ZCBkbyB0aGlzIG9yIG5vdCwgYnV0IHRoZSBQU1AgZmlybXdhcmUgZ3V5cyBtaWdodCBoYXZlLg0K
DQpDaHJpc3RpYW4uDQoNCkFtIDA3LjA1LjE5IHVtIDA2OjA4IHNjaHJpZWIgVHJpZ2dlciBIdWFu
ZzoNCj4gSUggcmUtcm91dGUgaXMgbm90IHN1cHBvcnRlZCBvbiBWZWdhIFNSLUlPViwgbmVlZCB0
byBiZSBza2lwcGVkDQo+DQo+IFRyaWdnZXIgSHVhbmcgKDIpOg0KPiAgICBkcm0vYW1kZ3B1OiBT
a2lwIElIIHJlcm91dGUgaW4gVmVnYTEwIFNSLUlPViBWRg0KPiAgICBkcm0vYW1kZ3B1OiBTa2lw
IElIIHJlcm91dGUgaW4gVmVnYTIwIFNSLUlPViBWRg0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3BzcF92MTFfMC5jIHwgNCArKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YzXzEuYyAgfCA0ICsrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQ0KPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
