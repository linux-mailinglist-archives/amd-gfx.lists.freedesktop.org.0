Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B135CBE625
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 22:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5106F8E7;
	Wed, 25 Sep 2019 20:09:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A93E6F8F6
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 20:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqYGeCJBfKMWMHoviJRoBMA7O4pWIutLF/gT0MHoUopzC9RmHoryWejSqcYJIno55J0KfYwF8FXDw8JujczScMX3s8PivpDh9TYDm4L4W/fy3LzuX8mWL9LF9Pajyd3btCrZjNMBf/WwgQSdcH67VFy9vmT/C+vhsPrVSOfoKsoxeH8BBpMKSas37DrD6DZuLJua3qF3HVGKShn1SqAX7w5bGR3JaSB7QpjNUdTQsAE5JDSwcSgeIs7gbgifJdQ+MoA2Sop1Zds9v1TSjux7dIUX6EGj+R6U4XnRYTDzsC7ma+w2MlLYX9ZwnX/QVs1h4EXY+NsC7DBy+yU7UCvS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctj7ys3DwcuwkCpCNLDES+zOvnnIRfw6g4nOaALFtpM=;
 b=f87HzTEWddHD60tW2jckP32UAFZBko3+xROfT4VPnwAIMKzIDm10hPb1A+rpzABuPxDiAz1caCrrRcHRMr3c70d8UHpuGiqgXgYP6zAlaCwD4oGc6XpHLxQbn1xHEWslkUGz8GAmSDuGeP5NOV97hZYShsYnGycHg6wczVuwjAt66DPFlisGN9F6TPQszOag05j1m8QmM7Aw7cUF8MqwnfyrwzLzb+mLub8BeB9oLOCDYVP37KzYPAI7kSUJbQ0UDPwIpKMmENnI1E47ZiRsuBcKRHVmxaI7/6zsExltBKMGRa1XGGzflQoJrn04+n5s/ZE6c3hWEOQJEwxblB7/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB2713.namprd12.prod.outlook.com (20.176.116.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 20:09:24 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 20:09:24 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBac8g+OAgABPluA=
Date: Wed, 25 Sep 2019 20:09:24 +0000
Message-ID: <DM6PR12MB3241269E6B5007951F0B59BEF4870@DM6PR12MB3241.namprd12.prod.outlook.com>
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
 <2b7c9fe9-0849-d3a5-99b4-3203c1b82de2@amd.com>
In-Reply-To: <2b7c9fe9-0849-d3a5-99b4-3203c1b82de2@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 497ad8e2-e4b0-41cf-17ae-08d741f442e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2713; 
x-ms-traffictypediagnostic: DM6PR12MB2713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB27133DEF561B11D7BF212EC1F4870@DM6PR12MB2713.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(199004)(13464003)(189003)(99286004)(110136005)(6246003)(7736002)(53546011)(305945005)(186003)(2501003)(64756008)(66946007)(66556008)(478600001)(7696005)(66476007)(52536014)(6506007)(76176011)(76116006)(66446008)(74316002)(229853002)(11346002)(6436002)(5660300002)(55016002)(71190400001)(25786009)(71200400001)(9686003)(3846002)(86362001)(6116002)(14454004)(476003)(256004)(81156014)(8676002)(33656002)(486006)(2906002)(316002)(102836004)(26005)(66066001)(446003)(81166006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VAA/P+aTfIvFD7EJPEsuW2dntBWLZZkMHItVaiLiiPIf99DxepIytCNaPgLc+Cnl/+mQdEM9FIRaQ+/1WLcpxBsDffwhQe8x4WiXxM9PhyaVlnsc/9cRzFmIF6tuz8TS6CBWkXxGUBe4f3yzOXNCbkkh2qMzEFio/0IlNPwNgKNlxpVBbmSsf8Az18P9xOXK+kiI1XrV6e6vbUzMZWa8dPYQKxNTcw/qNZdvWpYHtqXvXZF+AAT9zhU1xWJ4sBE45o/5XTT2jQ7oFW2XCo478TpBDwmRThIb7VWtK9DQmCDFfeg1QoKfQ7/a2NtA2gpkQ4PKr6qWaUAdz3sDkaPn6cyz6iEnK7zkIkJeWTufTiN2NucpXmJGzzYetEQtlyWY9NCl4wXZGsZ5AKwzhgs0cu+DpfSbkcOlkQVOEtPDrv0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497ad8e2-e4b0-41cf-17ae-08d741f442e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 20:09:24.5940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sfe90Oc/LeDX8SUBLt2sfv9DbBraAG9khpY9N/2ZEJjX1qAW+HEKEveP2DyXClNbFWkHl9HSZyZ14dhsKm0kKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctj7ys3DwcuwkCpCNLDES+zOvnnIRfw6g4nOaALFtpM=;
 b=D/Vq0o/Gkdjeuo4jxz+reCxhXXJW2wWLwX1fnl4CXeO4EEpqBish/e81Dxob6yqgrscCfRp8megbW7B5OHQr9wDxMNdAbb1kqai6PpG8O5rIcoD787FBQ0QaDkjPbuoOFVYU6cBUagncPTFZ06gToc/9zAKJj5L3mK7xLi7RkIU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBzZW50IG91dCBhbm90aGVyIGNoYW5nZSB0aGF0IHNldCB0aGUgIGFzaWNfZmFtaWx5IGFzIENI
SVBfTkFWSTEwIHNpbmNlIGZyb20gS0ZEIHNpZGUgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSBmb3Ig
bmF2aTEwIGFuZCAgbmF2aTEyLiANCg0KUmVnYXJkcw0KU2hhb3l1bi5saXUNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNSwgMjAxOSAxMToyMyBBTQ0K
VG86IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBBZGQgTkFWSTEy
IHN1cHBvcnQgZnJvbSBrZmQgc2lkZQ0KDQpZb3UnbGwgYWxzbyBuZWVkIHRvIGFkZCAiY2FzZSBD
SElQX05BVkkxMjoiIGluIGEgYnVuY2ggb2YgcGxhY2VzLiBHcmVwIGZvciAiQ0hJUF9OQVZJMTAi
IGFuZCB5b3UnbGwgZmluZCB0aGVtIGFsbCBwcmV0dHkgcXVpY2tseS4NCg0KUmVnYXJkcywNCiDC
oCBGZWxpeA0KDQpPbiAyMDE5LTA5LTI0IDY6MTMgcC5tLiwgTGl1LCBTaGFveXVuIHdyb3RlOg0K
PiBBZGQgZGV2aWNlIGluZm8gZm9yIGJvdGggbmF2aTEyIFBGIGFuZCBWRg0KPg0KPiBDaGFuZ2Ut
SWQ6IElmYjQwMzVlNjVjMTJkMTUzZmMzMGU1OTNmZTEwOWY5YzdlMDU0MWY0DQo+IFNpZ25lZC1v
ZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAxOSArKysrKysrKysrKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyANCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gaW5kZXggZjMyOWI4Mi4uZWRmYmFlNWMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTM4
Nyw2ICszODcsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gbmF2aTEw
X2RldmljZV9pbmZvID0gew0KPiAgIAkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LA0K
PiAgIH07DQo+ICAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZp
MTJfZGV2aWNlX2luZm8gPSB7DQo+ICsJLmFzaWNfZmFtaWx5ID0gQ0hJUF9OQVZJMTIsDQo+ICsJ
LmFzaWNfbmFtZSA9ICJuYXZpMTIiLA0KPiArCS5tYXhfcGFzaWRfYml0cyA9IDE2LA0KPiArCS5t
YXhfbm9fb2ZfaHFkICA9IDI0LA0KPiArCS5kb29yYmVsbF9zaXplICA9IDgsDQo+ICsJLmloX3Jp
bmdfZW50cnlfc2l6ZSA9IDggKiBzaXplb2YodWludDMyX3QpLA0KPiArCS5ldmVudF9pbnRlcnJ1
cHRfY2xhc3MgPSAmZXZlbnRfaW50ZXJydXB0X2NsYXNzX3Y5LA0KPiArCS5udW1fb2Zfd2F0Y2hf
cG9pbnRzID0gNCwNCj4gKwkubXFkX3NpemVfYWxpZ25lZCA9IE1RRF9TSVpFX0FMSUdORUQsDQo+
ICsJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLA0KPiArCS5zdXBwb3J0c19jd3NyID0gdHJ1
ZSwNCj4gKwkubmVlZHNfcGNpX2F0b21pY3MgPSBmYWxzZSwNCj4gKwkubnVtX3NkbWFfZW5naW5l
cyA9IDIsDQo+ICsJLm51bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsDQo+ICsJLm51bV9zZG1hX3F1
ZXVlc19wZXJfZW5naW5lID0gOCwNCj4gK307DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGtmZF9kZXZpY2VfaW5mbyBuYXZpMTRfZGV2aWNlX2luZm8gPSB7DQo+ICAgCS5hc2ljX2ZhbWls
eSA9IENISVBfTkFWSTE0LA0KPiAgIAkuYXNpY19uYW1lID0gIm5hdmkxNCIsDQo+IEBAIC00MjUs
NiArNDQzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBw
b3J0ZWRfZGV2aWNlc1tdWzJdID0gew0KPiAgIAlbQ0hJUF9SRU5PSVJdID0geyZyZW5vaXJfZGV2
aWNlX2luZm8sIE5VTEx9LA0KPiAgIAlbQ0hJUF9BUkNUVVJVU10gPSB7JmFyY3R1cnVzX2Rldmlj
ZV9pbmZvLCAmYXJjdHVydXNfZGV2aWNlX2luZm99LA0KPiAgIAlbQ0hJUF9OQVZJMTBdID0geyZu
YXZpMTBfZGV2aWNlX2luZm8sIE5VTEx9LA0KPiArCVtDSElQX05BVkkxMl0gPSB7Jm5hdmkxMl9k
ZXZpY2VfaW5mbywgJm5hdmkxMl9kZXZpY2VfaW5mb30sDQo+ICAgCVtDSElQX05BVkkxNF0gPSB7
Jm5hdmkxNF9kZXZpY2VfaW5mbywgTlVMTH0sDQo+ICAgfTsNCj4gICANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
