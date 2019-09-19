Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B378B7CC9
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 16:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F606F499;
	Thu, 19 Sep 2019 14:29:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710060.outbound.protection.outlook.com [40.107.71.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B06F499
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaAHdcGaSv3xgNOFqTyLwHQG1CHTDCXp9RHb8PbeI2wSybyMClm5r3DHo6pLV3GVld+xCn67J00x3BvjbFifEa8RCL2/Bel77oMFgJd/ICXM53J7wFHqUm/wxHMn2JvBCMOZDFM0NcuPBnNHSPonjEZ2W5cVQ8TfbFdN4ecHnP7dAlJgCKNXcyeg01X0w+vZbahmeIarxcGr/D+W/uYSZ6Ci3a+uBElvJGahjei+qbGmvJ6RFBz1Nd4VYvNoUoP1J323OtJ+QFU4ei6yrfJX+3SWgJMtqHL0rDrFhczAcGqALhlvo5CscaZhVTS5eFfzopEdRSVTbOkh+XbdNH18xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArQXPfrsfBsilQ6d2kk81cVkKi+Z9UFHgEDPMNyanvE=;
 b=LoTrJb3L+dWYvV2qBwWZFrwYzd46vhfVPWBDLjwjvxDF0CoEHLigyfV5lGNZIWYw1rnFGTTvQjEMmeDrHjY29zIYqbESdldD6qP30Dm4aPvU7XrR+P+RJHiDhVIb5pJwaAi9KVFWgPnEpW8MF5vXU18feaVX/Ms/AVgzqqXz6o0Vq3oKyNDRYS+SBIuRaywBJOqXMbBO0rmvTpPnomo/79hADazg2pdYNz3OQVzJVNujg0+aQhHwBEqBLIYxB6EEWtel3CR89EGNjQ7Bs9+TsEuFVWvA7dRHkUZUHW/8iLwsLer7YzG5FlLDHuSzv2ZF5tl70RiEhZUI9P/8IqNvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4155.namprd12.prod.outlook.com (10.141.8.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 19 Sep 2019 14:29:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:29:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Topic: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Index: AQHVbsYQEEDUGIXPREuLCqdMj7R/KaczD80A
Date: Thu, 19 Sep 2019 14:29:44 +0000
Message-ID: <fd47f3c6-a336-5a02-6ff2-3c24ad81dcb9@amd.com>
References: <20190919084136.82658-1-christian.koenig@amd.com>
In-Reply-To: <20190919084136.82658-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4557d5f-1273-4bb5-b786-08d73d0dd0f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4155; 
x-ms-traffictypediagnostic: DM6PR12MB4155:
x-microsoft-antispam-prvs: <DM6PR12MB4155B912E42F648D0406795392890@DM6PR12MB4155.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(189003)(199004)(229853002)(446003)(66476007)(66446008)(66556008)(2906002)(64756008)(26005)(102836004)(14444005)(186003)(71190400001)(486006)(2616005)(71200400001)(476003)(6512007)(66946007)(305945005)(11346002)(2501003)(6246003)(66574012)(7736002)(6486002)(256004)(65956001)(8936002)(3846002)(6436002)(31696002)(14454004)(478600001)(6116002)(66066001)(99286004)(58126008)(65806001)(81166006)(25786009)(53546011)(5660300002)(386003)(31686004)(8676002)(81156014)(76176011)(52116002)(86362001)(316002)(110136005)(36756003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4155;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rHkbS7ZqqcfKtrDYHjSGsGv4iXLtLaJRl/w/vPmpAeWpTDMWGpir3nVHbaBCkNzzU2nVAM6NkhemhJJKnUxlxALwR3Wdu2ZJGbZwUfkYcQIGMFaDgNAs5RfGb2Vxe9ZeX1Iafhl4nhpRdVlcfikYyghPKpKP5S7TkF/9TriWXd4hjs7p9Oe0xPtrkvxQFR3OMZwffMp4BqoFs8wiCJZktZc3505keBspNY7ipGjkDNMX4HH69b/I6cSYOJUBpPDH9SXGp5f40TQUXdkqat7au9yJ2o/Y0Iedbh40KUtGfBtKycsvjIMjnE+IasNZdl5YWznGn35jfxDzcUrgWUCDltK8u7DVK0fDTm/iVZUEB+hYShbdywrKIIMZoU04TanejNvVXYUCSLgosZOAuMjQTg0hxvvDSEVSeebIIrI2FOM=
x-ms-exchange-transport-forked: True
Content-ID: <76BBFF323E949B448C83DDCFA8F23055@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4557d5f-1273-4bb5-b786-08d73d0dd0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 14:29:44.7474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVpjcBpJl4bePMFm7ejcm6L9tDHQcmsRKamXv6e8RDXtAsjSAKXG3H8OPmT3vGDN3bppHYs0xgLSETxQ+KpwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArQXPfrsfBsilQ6d2kk81cVkKi+Z9UFHgEDPMNyanvE=;
 b=yj24KLSYqjmtiDqq8aPpOG1GBU7k0/SYtqufLnURE8UZauTspfCcfKn2ul0MFIMtlDUYa4cUYSmvC1aAF6SlpFo5hRoIXeYyLGlbEROEfMfRTvfDQQXOwqrje+MSueWez06Bpk2oPrSMUCDQ1WQFjaskEZItULJQz1vyvI1IrT4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

SSdtIG5vdCBkaXNhZ3JlZWluZyB3aXRoIHRoZSBjaGFuZ2UuIEp1c3QgdHJ5aW5nIHRvIHVuZGVy
c3RhbmQgaG93IHRoaXMgDQpjb3VsZCBoYXZlIGNhdXNlZCBhIFZNIGZhdWx0LiBJZiB0aGUgcGFn
ZSB0YWJsZXMgYXJlIHJlc2VydmVkIG9yIGZlbmNlZCANCndoaWxlIHlvdSBhbGxvY2F0ZSBhIG5l
dyBvbmUsIHRoZXkgd291bGQgbm90IGJlIGV2aWN0ZWQuIElmIHRoZXkgYXJlIG5vdCANCnJlc2Vy
dmVkIG9yIGZlbmNlZCwgdGhlcmUgc2hvdWxkIGJlIG5vIGV4cGVjdGF0aW9uIHRoYXQgdGhleSBz
dGF5IHJlc2lkZW50Lg0KDQpJcyB0aGlzIHJlbGF0ZWQgdG8gcmVjb3ZlcmFibGUgcGFnZSBmYXVs
dCBoYW5kbGluZz8gRG8gd2UgbmVlZCBzb21lIG1vcmUgDQpnZW5lcmljIHdheSB0byBoYW5kbGUg
ZXZpY3Rpb24gb2YgcGFnZSB0YWJsZXMgYW5kIHVwZGF0ZSB0aGUgcGFyZW50IHBhZ2UgDQpkaXJl
Y3RvcnkgKGludmFsaWRhdGUgdGhlIGNvcnJlc3BvbmRpbmcgUERFKT8NCg0KUmVnYXJkcywNCiDC
oCBGZWxpeA0KDQpPbiAyMDE5LTA5LTE5IDQ6NDEsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+
IFdoZW4gd2UgYWxsb2NhdGUgbmV3IHBhZ2UgdGFibGVzIHVuZGVyIG1lbW9yeQ0KPiBwcmVzc3Vy
ZSB3ZSBzaG91bGQgbm90IGV2aWN0IG9sZCBvbmVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDMgKystDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+IGluZGV4IDcwZDQ1ZDQ4OTA3YS4u
OGU0NGVjYWFkYTM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jDQo+IEBAIC01MTQsNyArNTE0LDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9f
Y3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJLmludGVycnVwdGlibGUg
PSAoYnAtPnR5cGUgIT0gdHRtX2JvX3R5cGVfa2VybmVsKSwNCj4gICAJCS5ub193YWl0X2dwdSA9
IGJwLT5ub193YWl0X2dwdSwNCj4gICAJCS5yZXN2ID0gYnAtPnJlc3YsDQo+IC0JCS5mbGFncyA9
IFRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1QNCj4gKwkJLmZsYWdzID0gYnAtPnR5cGUgIT0g
dHRtX2JvX3R5cGVfa2VybmVsID8NCj4gKwkJCVRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1Qg
OiAwDQo+ICAgCX07DQo+ICAgCXN0cnVjdCBhbWRncHVfYm8gKmJvOw0KPiAgIAl1bnNpZ25lZCBs
b25nIHBhZ2VfYWxpZ24sIHNpemUgPSBicC0+c2l6ZTsNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
