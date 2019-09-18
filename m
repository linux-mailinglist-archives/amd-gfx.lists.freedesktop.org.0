Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04DB5B82
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 08:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5DF6EDFC;
	Wed, 18 Sep 2019 06:00:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82A76EDFC
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 06:00:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvgHigb1UdBTFg957gb54JIdq3H7BZITxo8VRBQUsgqZMyZ/sPZlBjMRgIlj/eMC2XYp7Q9t0AyD5cRb+c2Ef1lZS+qw4HiUDUYMomS16dyCKs7JmOJbk7PZLKLuq1yZ+Aouat3jU0VH8ns4I4YugfVvIyl+PVlK1cubgmn0JStHGHz8DO26kmHSoVuC9drWJ4kt+m6NjQ1QolqwNrmHf2RbUHwVITbAGoAMcHumW+qYo9M+0yHXXGhGsAe0skNcgAdFJhQjwSm56Emv3fw2tWS6BSehJYMKxWdQlW5u9ucw+j+/pDCC94pvrbq9wyV2Ro1NxNKRY2Inn6Rs+YLvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRUSSadkSEu6QQ0ZWPBH9ch6sD7qsvRNkIP4RLJ9woE=;
 b=BSiGafNuPb2dc/mDdP384YWgiVgkZPjWUnWZUdkGI+TMESlLGzaJzh8/QcvhC7S00QtB441mGOJP8Qy+bz4uXA10hGt0/nepepUcKPFoExoYXBIT2eMjgN4C5Ys1xFn6bAF380ZeKVHRgjiOYhw+zwgi9BUq+9ZEJcq8o9zTWobuqoYx7ANDDPjLWcWbvcjyewXdYp6fvkpQi+8VVkMwzR83aZbrzGnpgDg+S2Gu7y9YYwXH1d0XZ2+EmpgG9NsL49uLRTE1l2XiV5gQGefJdAkETqst37xVasRMU/nxYNAuD4qw+jDaMUuiuic+fbVq7erju8Kc+HReurDNuCuXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3024.namprd12.prod.outlook.com (20.178.242.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 06:00:03 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 06:00:03 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: avoid null pointer dereference
Thread-Topic: [PATCH 1/2] drm/amdgpu: avoid null pointer dereference
Thread-Index: AQHVbdJwrZgxAhfTiUifG3oXE/GU7acw75Rw
Date: Wed, 18 Sep 2019 06:00:03 +0000
Message-ID: <MN2PR12MB3054F8BA6193829B9FFE34C2B08E0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190918033721.19070-1-guchun.chen@amd.com>
In-Reply-To: <20190918033721.19070-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54378f4e-4992-4eb2-b528-08d73bfd7306
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3024; 
x-ms-traffictypediagnostic: MN2PR12MB3024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30242CDE683575DFD024522FB08E0@MN2PR12MB3024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(13464003)(199004)(189003)(66476007)(14454004)(7736002)(6506007)(26005)(9686003)(8676002)(53546011)(55016002)(81156014)(6116002)(110136005)(476003)(81166006)(486006)(86362001)(229853002)(102836004)(7696005)(5660300002)(8936002)(6636002)(76176011)(256004)(14444005)(6436002)(6246003)(2906002)(2501003)(52536014)(71200400001)(186003)(66446008)(66946007)(76116006)(71190400001)(64756008)(3846002)(25786009)(74316002)(11346002)(33656002)(446003)(66066001)(478600001)(99286004)(305945005)(316002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3024;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +MaHusVwFhw0MElVA1CxZfpWpt84bzQ5IyzAPzfOnm2xbeI5NVB0Q7n0qBZW32+vxK9BXXp0LL/hePyWlKMuery4gb275z+iC9DLwY0kng7vInVGD1OEE9N7HSnXCoCKu4buTzVqxR9WqWgXL5e/OkOEc2iHayWm6zN10fYtiPME0s0+UlGuWQENiN8YFZGbIN4pHK/UvgTg16lTq8uj2MRy1EAd0xAPIzO+/mibLHwSayEJKn/MjVPAyJB9erGWbZwnmlIca6E7vMygldMkQW7irgiT5Aht1R7FfVq8NmTe9+YXKuKvP8qm+Oi5tr4K/p33LfN2JP99ptdcWvmo7QOBCg44caCRUQ0GlzluBSk6IkYFtdk6GkCpOq4oc2PFQiMWmLdhgE+p+OtQHMEz9uH4gRoca38zfm4Hua55mLU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54378f4e-4992-4eb2-b528-08d73bfd7306
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 06:00:03.4391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3BR25h50C8W+WLN2b1ax+x3Ad/IrgAwyXbB5FZULx6iuS+4oO8dCzmbWuaxF9nK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRUSSadkSEu6QQ0ZWPBH9ch6sD7qsvRNkIP4RLJ9woE=;
 b=Dnt1TELk07XBicLB6w0w+S6Dk/FDZ1+iOyHqLxDv0aHIAinAunHAkhUtQzJstEzLfY4udvVlN50iimJ3DKgktTQaxZyEZjROXD90ZBTdEjHGhnJxxq6no5FcErEXGisPXzmwztZ3jy8b9S/in22UWNznkUMf17US0tBWMuKNQIs=
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

ImNvbnRyb2wgPSAmY29uLT5lZXByb21fY29udHJvbCIgaXMgc3VnZ2VzdGVkLCBhcGFydCBmcm9t
IHRoaXMsIHRoZSBzZXJpZXMgaXM6DQoNClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3Ux
QGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwg
R3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDE45pelIDEx
OjM4DQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcN
Cj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29t
PjsNCj4gR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBD
YzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBkcm0vYW1kZ3B1OiBhdm9pZCBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UNCj4gDQo+IG51
bGwgcHRyIHNob3VsZCBiZSBjaGVja2VkIGZpcnN0IHRvIGF2b2lkIG51bGwgcHRyIGFjY2Vzcw0K
PiANCj4gQ2hhbmdlLUlkOiBJODVjMGEwOTZlZWY3N2NhZDNhMzQyNjVjOTk1YjE4NDU0NTFlMDRk
MA0KPiBTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA0ICsrLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDA5MGRh
ZjU5NTQ2OS4uYzMwOTBmMGViNjA0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jDQo+IEBAIC0xMzM0LDEzICsxMzM0LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3Jhc19zYXZlX2JhZF9wYWdlcyhzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCj4g
IAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsN
Cj4gIAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7DQo+IC0Jc3RydWN0IGFtZGdw
dV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wgPQ0KPiAtCQkJCQkmYWRldi0+cHNwLnJhcy5y
YXMtPmVlcHJvbV9jb250cm9sOw0KPiArCXN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9s
ICpjb250cm9sOw0KPiAgCWludCBzYXZlX2NvdW50Ow0KPiANCj4gIAlpZiAoIWNvbiB8fCAhY29u
LT5laF9kYXRhKQ0KPiAgCQlyZXR1cm4gMDsNCj4gDQo+ICsJY29udHJvbCA9ICZhZGV2LT5wc3Au
cmFzLnJhcy0+ZWVwcm9tX2NvbnRyb2w7DQo+ICAJZGF0YSA9IGNvbi0+ZWhfZGF0YTsNCj4gIAlz
YXZlX2NvdW50ID0gZGF0YS0+Y291bnQgLSBjb250cm9sLT5udW1fcmVjczsNCj4gIAkvKiBvbmx5
IG5ldyBlbnRyaWVzIGFyZSBzYXZlZCAqLw0KPiAtLQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
