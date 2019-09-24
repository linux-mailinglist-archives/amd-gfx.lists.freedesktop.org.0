Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE2BC170
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 07:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A96E9F3;
	Tue, 24 Sep 2019 05:44:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35BC6E9F2
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 05:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBXst6z5tAmpS+eqA/cB7rSGV1qDE8U02aCH549lnfWp1WzBChEzUq1C07o8LGcTniFQwfIZjhi6E38W4355QuVsIbUZfuoc8wW5lNFpDHQlxNWfTnssPLIEcyehGEiWxNR+/A8Z0DwmcpcR/nkeNd/hIus7SFO0r48+37FOJahEGLNyeX1G0iH9rgK6g1yNuh9Zv6EvVr+u1sq9vqc3GxKdokcKloHbrUqNwyf9P7YhArQk+6pGlTImkty1UqhNlETs0uVZrrbB7ldAALD/QzW8FBmvYStK+Hotv5mccnMIJDWhZwwbyIc6gVbbzyoDSBPibkB7YVPoUBmlZCFKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCr7QLjRHwmvDiVwrlTGWUvvn5TVlD0F4+ds/+kn0+M=;
 b=emg0rifAUGg3enKmObmJEGafTMBM1CN5rVsXB/o8yNrx9CXmgfJEtcRye4IKSwY/l+GkyKaQn2sxLMu9/L9DJhQCtGJvod9LS3wRa1JfatE9TcSTxv4sOVy1JuQskHbeDZeqXzznAYkWnr/Mbh8C2Iw2yKFN1R+orni9kye044A1cHpP+jVilKTv2ew0d5Pv7H2usO/mv5JqQ0Tc7yXt2eiTqojSxFKWIl6wZJHe+9o3g5mFvhFKW45ma8j3eiZMz+dOwcJe88WM8LicE1uwFiu6s3opnApnF4GCJQJA7oBTmGVfkYlp2ffYVZl0tQHbQ/6uS+U1cfcqBflySgkG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1161.namprd12.prod.outlook.com (10.168.236.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 05:44:27 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 05:44:27 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Topic: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Index: AQHVcomcPIVF8MwTyk2ED+If0loJ6Kc6ULCw
Date: Tue, 24 Sep 2019 05:44:26 +0000
Message-ID: <DM5PR12MB1418A62797503948F23937BAFC840@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1569296333-5386-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1569296333-5386-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 500f7516-bddd-4d26-7830-08d740b24318
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1161; 
x-ms-traffictypediagnostic: DM5PR12MB1161:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB11618A7F29478A07F503DB9AFC840@DM5PR12MB1161.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(13464003)(26005)(86362001)(33656002)(55016002)(6306002)(6506007)(53546011)(7736002)(76176011)(7696005)(229853002)(74316002)(52536014)(3846002)(305945005)(5660300002)(9686003)(99286004)(4326008)(6436002)(2906002)(256004)(66066001)(446003)(186003)(6116002)(6246003)(25786009)(486006)(76116006)(478600001)(14454004)(81156014)(102836004)(476003)(71190400001)(71200400001)(110136005)(8936002)(14444005)(64756008)(966005)(81166006)(66446008)(2501003)(66946007)(8676002)(316002)(66556008)(66476007)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1161;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: la3c8b4GERjd72+2ryJXY/GiEbiSFUeEzdbP/1UNvmGu+CBbRwEYPosua8/DAPOhlkpfUf+lJqK2ot+OCvSjL5ztnAGtXTXs+C11SGGEzluLPry4KrgUshltxo3aPq+XkgHBvj5isnYM1dFy9QYwy7rrB04D0I+6nMulL5K1Gn0Uy2pIJeEzUX9ImletINzCeEFzoBsqwxtBxVuXHnLIRxRjz+ATTl80a1KwQO3QkgogT2UnZZBS1896K6SNA+RYA3LBpPwR57j1LGZkJS4YljsL6gbhx0r365AVCUVD4t+FnxKXLpa5WNqDxRZnmD7ELpdpDIdKifrxJiBvV7Bq0pWOLwPHP7UTU+qpIjrhaw20Tli/X3uS78l4+nVraMCoiR1Q8F5m1uBrxRrE1gtx0DISYuv0Zbs7XO+iykC7zsA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500f7516-bddd-4d26-7830-08d740b24318
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 05:44:26.9108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZOQsK5uMeeTd5Esh5O6RVcRF8VTnIiA9GaXTzk5I3ntL40Pj9Ci3yxE740VChsPmvF7fmmtwmHbWp40DXxsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCr7QLjRHwmvDiVwrlTGWUvvn5TVlD0F4+ds/+kn0+M=;
 b=LNRIxD32KN1SUgraT2bElckohM6imAFzkfgADeRFcgwH5XFeQW9vY2xTgbLS8YmhgY9SPhQeTvuyJLvSE1SvuPIgYZxLyjW905OJGm4vrXpXCZf9kPJGrHXRP/NDyM1czZw7tqr4AlL8A7bRHw6WuoqFihrzFYxQk3dpa25huRc=
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHBhdGNoIGlzIGluIGhpZ2ggcmlzayB0byBicmVhayBvdGhlciBWRyBzZXJpZXMgYW5kIE1J
IHNlcmllcy4gQW55IGNvbmZpZGVuY2UgdGhpcyBpcyBhIGNvbW1vbiBodyBidWcgYWNyb3NzIGFs
bCBVTUMgNi54IGdlbmVyYXRpb25zPyANCg0KUmVnYXJkcywNCkhhd2tpbmcNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNb25rIExpdQ0KU2VudDogMjAxOeW5tDnmnIgy
NOaXpSAxMTozOQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTGl1LCBN
b25rIDxNb25rLkxpdUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXgg
YW4gVU1DIGh3IGFyYml0cmF0b3IgYnVnDQoNCmlzc3VlOg0KdGhlIFVNQyBoL3cgYnVnIGlzIHRo
YXQgd2hlbiBNQ0xLIGlzIGRvaW5nIHRoZSBzd2l0Y2ggaW4gdGhlIG1pZGRsZSBvZiBhIHBhZ2Ug
YWNjZXNzIGJlaW5nIHByZWVtcHRlZCBieSBoaWdoIHByaW9yaXR5IGNsaWVudCAoZS5nLiBESVNQ
TEFZKSB0aGVuIFVNQyBhbmQgdGhlIG1jbGsgc3dpdGNoIHdvdWxkIHN0dWNrIHRoZXJlIGR1ZSB0
byBkZWFkbG9jaw0KDQpob3c6DQpmaXhlZCBieSBkaXNhYmxpbmcgYXV0byBQcmVDaGcgZm9yIFVN
QyB0byBhdm9pZCBoaWdoIHByaW9yaXR5IGNsaWVudCBwcmVlbXB0aW5nIG90aGVyIGNsaWVudCdz
IGFjY2VzcyBvbiB0aGUgc2FtZSBwYWdlLCB0aHVzIHRoZSBkZWFkbG9jayBjb3VsZCBiZSBhdm9p
ZGVkDQoNClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KQ2hhbmdl
LUlkOiBJYWY2ZWIyYTIwYTQ3ODVlYzg0NDBlNjRkNWUwY2FlNjdhYTA2MDNkYQ0KLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDE4ICsrKysrKysrKysrKysrKysr
Kw0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KaW5kZXggNjEwMmRlYS4uODI3MWIwYyAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCkBAIC0xMzA2LDYgKzEzMDYsMjQgQEAgc3RhdGljIGlu
dCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCSAo
dW5zaWduZWQpKGFkZXYtPmdtYy5nYXJ0X3NpemUgPj4gMjApLA0KIAkJICh1bnNpZ25lZCBsb25n
IGxvbmcpYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2FydC5ibykpOw0KIAlhZGV2LT5nYXJ0
LnJlYWR5ID0gdHJ1ZTsNCisNCisJLyogZGlzYWJsZSBhdXRvIFBjaGcgaXMgYSB3L2EgZm9yIHRo
ZSB2ZWdhMTAgVU1DIGhhcmR3YXJlIGJ1ZyAqLw0KKwlXUkVHMzIoMHg1MDEwYy80LCAweDEwMDIp
Ow0KKwlXUkVHMzIoMHg1MjEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHg1NDEwYy80LCAweDEw
MDIpOw0KKwlXUkVHMzIoMHg1NjEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgxNTAxMGMvNCwg
MHgxMDAyKTsNCisJV1JFRzMyKDB4MTUyMTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDE1NDEw
Yy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgxNTYxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4
MjUwMTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDI1MjEwYy80LCAweDEwMDIpOw0KKwlXUkVH
MzIoMHgyNTQxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MjU2MTBjLzQsIDB4MTAwMik7DQor
CVdSRUczMigweDM1MDEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgzNTIxMGMvNCwgMHgxMDAy
KTsNCisJV1JFRzMyKDB4MzU0MTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDM1NjEwYy80LCAw
eDEwMDIpOw0KIAlyZXR1cm4gMDsNCiB9DQogDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
