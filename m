Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4997CA04D
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BCA6E9F9;
	Thu,  3 Oct 2019 14:28:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7616E9F9
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdnKVCrVZE0KaJya/RYQWK5a05ZbMEN85l03Nb6Rro963sHJUz34+bZ1vBCe4WLHMirNW9ye3wel/n9tcZnxfNwZoY0pliud+kNiPKI4ZFZpxVq+87/uE+1J0f7UmXDlfyaF4NMrpEw0j6Vzau1q93N+gLAT5Hh30SlTiTw7MWjyuXPV403PUxl2k80QPjV2sK38YVqYIWkP66qBWygB5B+sKZTskWsuKyQ66B7I/imxGr8YFHvq/w1IVt8T1auaKypRd1o143BVJlZ7rD6BPKIbP2uRkE0xF3SBtsZ6XoGgA/JXetbxxH254spG1EpD9m4+NHtMOe+0HgoOYkoErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuN4D99p3yc0z2UE/s9nIC3Y+f0Hicr+9K2TyQfWbVs=;
 b=MIy8exCzh5HapxRiUIem/CwG3rPvUGhh6UvUuxfQT55U7OdR9GMvMcbV6E2RERYggmjEqiJtvdG/6kJZw+g77Zm9KUvgCJMZyvgzd8nW6OH/ZJC7T4iWq8Z9nhIyeEHlKTOHyHc6xHi0q/0T/M8BUAoa8Q8WSVgZU2mr4eKn/sDEEg6VVJ33NIRJ9WgXEp8QxalQXttfcbob9m8jxlFVx7XU9QV/7Xqv9gcvZufoelkMlWshH9D6lvdcLKhbiiF8+hMRp4mbpXmAF3z7cvBvfVouJl0XD4odcVzcWpD2CRApMd3llWT8n22Rz8zfE8Z6dl6om99hz+DqYxEVrIrPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3962.namprd12.prod.outlook.com (10.255.174.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 14:28:00 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::1cf5:f2b6:a693:e97f]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::1cf5:f2b6:a693:e97f%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 14:28:00 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: disable MSI-X on APUs
Thread-Topic: [PATCH 2/2] drm/amdgpu: disable MSI-X on APUs
Thread-Index: AQHVefTFRrQ2G/XamEycuU/tLKdtxKdI+ZcA
Date: Thu, 3 Oct 2019 14:27:59 +0000
Message-ID: <97a4e63f-d141-e71e-a9d6-17eacbded5c2@amd.com>
References: <20191003141326.7600-1-alexander.deucher@amd.com>
 <20191003141326.7600-2-alexander.deucher@amd.com>
In-Reply-To: <20191003141326.7600-2-alexander.deucher@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed6b154-daac-4e91-cc19-08d7480de425
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB396210E43845521E0E9AC9A3F49F0@DM6PR12MB3962.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(99286004)(36756003)(14444005)(478600001)(3846002)(25786009)(6116002)(486006)(305945005)(65806001)(65956001)(14454004)(2906002)(7736002)(8936002)(186003)(66476007)(53546011)(446003)(476003)(2616005)(11346002)(386003)(76176011)(6506007)(66446008)(66556008)(64756008)(31686004)(66946007)(102836004)(26005)(81156014)(54906003)(110136005)(8676002)(81166006)(66066001)(316002)(52116002)(58126008)(229853002)(6436002)(5660300002)(2501003)(4326008)(71200400001)(71190400001)(6512007)(31696002)(86362001)(256004)(6246003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3962;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ubVlAujtWHh/n6J1rb2ujsur/HQPRduD15Zmnp4xekRvXp5Pzfxbdm4ieLnTHRCLATs6w46gdjWSkz4nCTub8UwRC484LP7z4OjTt8Q1d3OP2TCezjFxIFkMOXXD13rv8OBgkUj4GKyfsBPC5XfhmcBH+Dd/Zw5SfKxbBQni1h5IVQWgHPuBVrr3TgWYX7V86xFG66OCwGk/ynQzjBvhwykwRkt/JVoqiUCpE/mCfGuSNQa/6csC7b9x8mTCgEHOWhzRlXl4OdHqJYzbFjMhpylifrUVRFA9UgMqFuSJ121eCOw13nkOSPgk+/UHhamJrgEsggfxBcYaYVJ3a5+xtgRuanlCUiDH2HIGnOK5TSMr0xcQOZD3yvkiIJvX4FpKKBxJgpvosqBBtkvYWJUwfqliby5rf+mAg2g1/+v/pRg=
Content-ID: <99CAE4CAFDE48E48BF2E87ECD53DE52E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed6b154-daac-4e91-cc19-08d7480de425
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 14:27:59.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEk8pKfpvUxJPaAX/4lTOv+0Rah+wJqFRym/EJUsgecSKOKtLoD2ME6211b45CBZawO8bNc7jk48VfufrOQ+1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuN4D99p3yc0z2UE/s9nIC3Y+f0Hicr+9K2TyQfWbVs=;
 b=E8uAMLWPsVP7u3AdqC8fG0WljHcU+9dlMEBtV6drGUYcXHMNqDTcwHYhcDreWj8m3dX4QQYXx/uSpX9s+n30ysMPn7JUo6zLEZAg8a4zVFPa0izboFZHDnXsyIhFEtDfoKbxe0vW91AtPb0g5pysYIQvW9FCsaqwfS5wX5Xkpqw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "StDenis,
 Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEFsZXggYW5kwqAgVG9tIHRvIGNhdGNoIGFuZMKgIHJldm9sdmUgdGhlIGlzc3VlIC7C
oCBJIGRpZG4ndCBkbyANCmVub3VnaCB0ZXN0IG9uIG9yaWdpbmFsIHRlc3QuDQoNCldlIGRvbid0
IG5lZWQgdG8gZW5hYmxlIG1zaXjCoCBvbiBBUFUgLiDCoCBUaGUgc2VyaWFscyBpcyByZXZpZXdl
ZCBieSANCnNoYW95dW4ubGl1IDxzaGFveXVuLmxpdUBhbWQuY29tPg0KDQoNClJlZ2FyZHMNCg0K
c2hhb3l1bi5saXUNCg0KDQoNCk9uIDIwMTktMTAtMDMgMTA6MTMgYS5tLiwgQWxleCBEZXVjaGVy
IHdyb3RlOg0KPiBSYXZlbiBjbGFpbXMgdG8gc3VwcG9ydCB0aGVtLCBidXQgc2VlbXMgdG8gaGF2
ZSBwcm9ibGVtcy4gIFN0aWNrDQo+IHdpdGggTVNJcyBmb3Igbm93IG9uIEFQVXMuDQo+DQo+IFRl
c3RlZC1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyB8IDMgKystDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jDQo+IGluZGV4IDk4YWEyOGVkYmE2YS4uOGYy
MjM2YmQ3ZDBlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaXJxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5j
DQo+IEBAIC0yNDgsNyArMjQ4LDggQEAgaW50IGFtZGdwdV9pcnFfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikNCj4gICAJCXVuc2lnbmVkIGludCBmbGFnczsNCj4gICAJCWludCBudmVj
ID0gcGNpX21zaXhfdmVjX2NvdW50KGFkZXYtPnBkZXYpOw0KPiAgIA0KPiAtCQlpZiAobnZlYyA8
PSAwKSB7DQo+ICsJCS8qIFJhdmVuIGNsYWltcyB0byBzdXBwb3J0IE1TSS1YLCBidXQgc2VlbXMg
dG8gaGF2ZSBwcm9ibGVtcyAqLw0KPiArCQlpZiAoKG52ZWMgPD0gMCkgfHwgKGFkZXYtPmZsYWdz
ICYgQU1EX0lTX0FQVSkpIHsNCj4gICAJCQlmbGFncyA9IFBDSV9JUlFfTVNJOw0KPiAgIAkJCW52
ZWMgPSAxOw0KPiAgIAkJfSBlbHNlIHsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
