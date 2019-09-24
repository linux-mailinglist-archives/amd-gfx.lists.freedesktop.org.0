Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC52BC176
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 07:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1346E9F2;
	Tue, 24 Sep 2019 05:48:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969C6E9F2
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 05:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nh79mc/SWTJ2h09fsHYTx2lzI82fkqGMNzGDo9yRuqRCqc32wIFSCvPksWl7LGposEeSaxoUS+Ly70Pgr5iwn/H26yK7GCXnH1oSRW0WgrozdSXtkO6f8OSdXANrII5tfW036WBxW9bdA0qP5P+sXE/crNNX5o8oOFCQKg0S3SMf+8fO76jhyIvku7DMFEuuWOSHbBPoKHbM92SUBpmYSbe+yjPltwP3EfcduhL4fMpg2ixtVeiQn0BGgiNWvRpsRb93rwZukVUYnDS/en8NZ5zDIpQdtJQBWH0elORJqntIeB/cAzI+VB64B8ugQ47pgqk/X1VeyMf3CeiDYBNKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB+DuXva5MKMyX4BLOol+DvYOZEbrBxSaDUHiCgg2cM=;
 b=b6xEqtxXCtOcEmTlVDN9PlaWQPmwJ/DKEInsfWzf4rht3dl5rDRP+vaZSQ0MgJWqD5PzhDV7DEdQPuLOAU9Du+fx2WmhbY+vhcYtyhSqPYC7fU6md9jnbt2g2+FSJ2MZ5dg6SyJLfUdn4HJyEpHIMROEcIagIf8EWhibJCcet6hBRTB6Y0TF35bHHO2edlqia/ue4F312dfgYtTc0jZ3koJJ78sCiuAg0vQgRHmncTjrx3QPlqKi1PT15yoITTiHZheqcNYsdWDkyIS6VAmC28Gu99rq9A30xMfM63wwnwn4XR0uZ/kwAt6GdHPDVubqDFQdcLK4G/99teXJBqzMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1225.namprd12.prod.outlook.com (10.168.240.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 05:48:06 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 05:48:06 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Topic: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Index: AQHVcomcPIVF8MwTyk2ED+If0loJ6Kc6ULCwgAAAvmA=
Date: Tue, 24 Sep 2019 05:48:06 +0000
Message-ID: <DM5PR12MB1418571933B698B58DEAC861FC840@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1569296333-5386-1-git-send-email-Monk.Liu@amd.com>
 <DM5PR12MB1418A62797503948F23937BAFC840@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418A62797503948F23937BAFC840@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a17c1fdb-5537-4302-23eb-08d740b2c602
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1225; 
x-ms-traffictypediagnostic: DM5PR12MB1225:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1225F7F3FF4F7D11D2A91966FC840@DM5PR12MB1225.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(199004)(189003)(13464003)(14454004)(5660300002)(76116006)(66446008)(66476007)(66556008)(64756008)(71190400001)(81156014)(66946007)(14444005)(52536014)(7736002)(486006)(305945005)(6436002)(256004)(3846002)(6116002)(86362001)(6306002)(2906002)(316002)(71200400001)(2940100002)(74316002)(9686003)(2501003)(6246003)(76176011)(110136005)(102836004)(478600001)(53546011)(476003)(55016002)(229853002)(6506007)(7696005)(25786009)(33656002)(99286004)(446003)(4326008)(8676002)(11346002)(66066001)(186003)(8936002)(966005)(81166006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1225;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HDN8PhGlwkjst5yqoQwawZYs86C4XUzl8iAPIEOhXllGzB+g1t4wgPoVPcquh7shohfcGq4/fYZs36mC2TnSsIWqibvwzzfdn+Ws8H020mtgTQuMFdlwjZnXtGdhtBa7PHvVN8A2GJ9/EhxX1wNI1InTRuhnq2J4XCkcxqo6UtckFJK49j1UE48kXDiS+bNnKJcwWthASkrZrgl/9phRekqQz7O0kZoiMTJgLFs0pSJLHAMf6MMH2n3pualifyHjncNCiOaoekJJbzLLB7/i4QkCh8l+MBXGY6FiMUFt65hiBVFu5poewEgK51phln6ADP4t0nSpO8YqE4kqNtzXe8o9euwvH46UJVxDsctPzvr5bMd0YyadtFbGic8+JvU6rwk/MQNkd5pTn2LCR/BQ/ttqZDRgJOJkdPrdHzjvNWo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17c1fdb-5537-4302-23eb-08d740b2c602
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 05:48:06.4680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cv7SBE4RUPW6PCsXoePoQUeQkN6X3gGL8eyEY2bCexOgkf7jiLW59OiorAtjQmuJuCeSqir0O093rXmLtGUHEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1225
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB+DuXva5MKMyX4BLOol+DvYOZEbrBxSaDUHiCgg2cM=;
 b=MI+Avd2oLRUMVUj1/nVu8EfGatHV5ZNJqF6pBjKwRP/vPopeP28cucIpeDaXi5OAo9UsAsr+n7dSqL/vnVcj1PESnJsFAvmPuwW1rqlz3MZbGTomSGrKAX7KbURhkLQf77a3LusNK8I1VhnmdgBp4SlWAdS/1xtz9sMFKI7YFVA=
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

SSdkIHN1Z2dlc3QgeW91IGNyZWF0ZSB1bWMgZnVuY3Rpb24gdG8gYXBwbHkgdGhlc2Ugd29ya2Fy
b3VuZCB0byBWRzEwIG9ubHkgaWYgd2UgYXJlIG5vdCBzdXJlIHRoaXMgaXMgYSBjb21tb24gaHcg
YnVncy4gWW91IGNhbiByZWZlciB0byBhbWRncHVfdW1jX2Z1bmNzIGZvciBjcmVhdGluZyB1bWMg
Y2FsbGJhY2sgZnVuY3Rpb25zLg0KDQpJbiBhZGRpdGlvbiwgbm9ybWFsbHkgdW1jIHBlciBjaGFu
bmVsIHJlZ2lzdGVycyB3aWxsIGhhdmUgY29uc3RhbnQgb2Zmc2V0LCBsaWtlIDB4MjAwIGZvciB2
ZzEwLiBZb3UgY2FuIGxldmVyYWdlIHRoaXMgdG8gc2ltcGxpZnkgdGhlIGxvZ2ljIGluIHRoZSB1
bWMgY2FsbGJhY2sgZnVuY3Rpb24uDQoNClJlZ2FyZHMsDQpIYXdraW5nDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmhhbmcsIEhhd2tpbmcNClNlbnQ6IDIwMTnlubQ5
5pyIMjTml6UgMTM6NDQNClRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT4N
ClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IGZpeCBhbiBVTUMgaHcgYXJiaXRyYXRv
ciBidWcNCg0KVGhlIHBhdGNoIGlzIGluIGhpZ2ggcmlzayB0byBicmVhayBvdGhlciBWRyBzZXJp
ZXMgYW5kIE1JIHNlcmllcy4gQW55IGNvbmZpZGVuY2UgdGhpcyBpcyBhIGNvbW1vbiBodyBidWcg
YWNyb3NzIGFsbCBVTUMgNi54IGdlbmVyYXRpb25zPyANCg0KUmVnYXJkcywNCkhhd2tpbmcNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNb25rIExpdQ0KU2VudDogMjAx
OeW5tDnmnIgyNOaXpSAxMTozOQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1OiBmaXggYW4gVU1DIGh3IGFyYml0cmF0b3IgYnVnDQoNCmlzc3VlOg0KdGhlIFVNQyBoL3cg
YnVnIGlzIHRoYXQgd2hlbiBNQ0xLIGlzIGRvaW5nIHRoZSBzd2l0Y2ggaW4gdGhlIG1pZGRsZSBv
ZiBhIHBhZ2UgYWNjZXNzIGJlaW5nIHByZWVtcHRlZCBieSBoaWdoIHByaW9yaXR5IGNsaWVudCAo
ZS5nLiBESVNQTEFZKSB0aGVuIFVNQyBhbmQgdGhlIG1jbGsgc3dpdGNoIHdvdWxkIHN0dWNrIHRo
ZXJlIGR1ZSB0byBkZWFkbG9jaw0KDQpob3c6DQpmaXhlZCBieSBkaXNhYmxpbmcgYXV0byBQcmVD
aGcgZm9yIFVNQyB0byBhdm9pZCBoaWdoIHByaW9yaXR5IGNsaWVudCBwcmVlbXB0aW5nIG90aGVy
IGNsaWVudCdzIGFjY2VzcyBvbiB0aGUgc2FtZSBwYWdlLCB0aHVzIHRoZSBkZWFkbG9jayBjb3Vs
ZCBiZSBhdm9pZGVkDQoNClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29t
Pg0KQ2hhbmdlLUlkOiBJYWY2ZWIyYTIwYTQ3ODVlYzg0NDBlNjRkNWUwY2FlNjdhYTA2MDNkYQ0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDE4ICsrKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KaW5kZXggNjEwMmRlYS4uODI3MWIwYyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCkBAIC0xMzA2LDYgKzEzMDYsMjQgQEAg
c3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikNCiAJCSAodW5zaWduZWQpKGFkZXYtPmdtYy5nYXJ0X3NpemUgPj4gMjApLA0KIAkJICh1bnNp
Z25lZCBsb25nIGxvbmcpYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2FydC5ibykpOw0KIAlh
ZGV2LT5nYXJ0LnJlYWR5ID0gdHJ1ZTsNCisNCisJLyogZGlzYWJsZSBhdXRvIFBjaGcgaXMgYSB3
L2EgZm9yIHRoZSB2ZWdhMTAgVU1DIGhhcmR3YXJlIGJ1ZyAqLw0KKwlXUkVHMzIoMHg1MDEwYy80
LCAweDEwMDIpOw0KKwlXUkVHMzIoMHg1MjEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHg1NDEw
Yy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHg1NjEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgx
NTAxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MTUyMTBjLzQsIDB4MTAwMik7DQorCVdSRUcz
MigweDE1NDEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgxNTYxMGMvNCwgMHgxMDAyKTsNCisJ
V1JFRzMyKDB4MjUwMTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDI1MjEwYy80LCAweDEwMDIp
Ow0KKwlXUkVHMzIoMHgyNTQxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MjU2MTBjLzQsIDB4
MTAwMik7DQorCVdSRUczMigweDM1MDEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgzNTIxMGMv
NCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MzU0MTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDM1
NjEwYy80LCAweDEwMDIpOw0KIAlyZXR1cm4gMDsNCiB9DQogDQotLQ0KMi43LjQNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGlu
ZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
