Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DBB15AB
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 23:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FD16EE2D;
	Thu, 12 Sep 2019 21:06:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476976EE2F
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 21:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2/O1N9iUOnNoha7HIqfh1ERy01aN3CiCscE0parTfs0fxyq2bcJLGtF0a4nmEk/REjwQ2X1D9OxFPecAyryLXv9OU+wUBaCIl61PVT+lhNMV+jfBEcEXsr1AKrONep59pACbIViNV/Iz6VQv1Xdb5eqghod3oXmQUW2higpsGRAXubW4Kh9FocoK2B3mZSoeeVPrGt9XY3iPD6SuEjmVqX4AIhq2wVXwXKgQUT8wLb0NUn8bdGwIlDgq/8ubQ6jBl58ZeKkj3RCzC66nv1Mhd3OhSAvAvIKryZY/BwEKJZBW2FvmRH2s8gxGSjXpFMupzm42np2n4d/BRSlVoZgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAl4/nl6vVTxFCHdi9XIv+p5Zd9BjBzvlJAvRTALbHs=;
 b=lQ5pv2iOQQrz6vXh6Xe1VsQYz/gKGeNpSlnTx2BcQIkLWZ8Ui+lfZrUAM6h75dLnYZNU2GGEIgVOL8c5Ha6qacee10FlKQuWtk9B6goSIgo94GI48lwUFjtit5OebTSkU9YJ0T4qj3G70VHmPcgAPVmhJOux8QnrCMg01dGqs4QlOZBE6Xus3Cob++Kuqmvex81DXpgNb2TCC6n8yLInZPxtLj8JAO2za3ufzlce5B+hGz+SkpTtJq5r4W5iO6Lrt4CmMNGO5ANjD9HCteNwUTF4bwyBJua/kmJwipJfqoyFhbiAmGbDv1U3AE/VnKa90uZueHUlwKn1uK/jOWEfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3356.namprd12.prod.outlook.com (20.178.198.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Thu, 12 Sep 2019 21:06:39 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 21:06:39 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/amdgpu/nbio7.4: add hw bug workaround for
 vega20"
Thread-Topic: [PATCH] Revert "drm/amdgpu/nbio7.4: add hw bug workaround for
 vega20"
Thread-Index: AQHVaBJDF4GqjrdwA0WExLetwhZyTacoi8mA
Date: Thu, 12 Sep 2019 21:06:39 +0000
Message-ID: <35e2248a-b2d7-a955-6c2b-b9e182e8dcc6@amd.com>
References: <20190910195922.16898-1-kent.russell@amd.com>
In-Reply-To: <20190910195922.16898-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0fc2cb2-c411-46e1-1863-08d737c51a7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3356; 
x-ms-traffictypediagnostic: DM6PR12MB3356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33567B8394FA96BD3E5AC79E92B00@DM6PR12MB3356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:556;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(86362001)(53546011)(2501003)(31696002)(81156014)(6506007)(102836004)(14444005)(8676002)(386003)(81166006)(305945005)(99286004)(7736002)(6486002)(8936002)(31686004)(14454004)(25786009)(2906002)(229853002)(478600001)(52116002)(36756003)(256004)(186003)(71190400001)(71200400001)(66946007)(66446008)(65806001)(26005)(66066001)(66476007)(66556008)(6116002)(6436002)(65956001)(53936002)(6246003)(316002)(476003)(110136005)(58126008)(6512007)(3846002)(486006)(64756008)(5660300002)(76176011)(11346002)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3356;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vD3/obQoaMLNY+BFZGActwsJ4ck3fbrgyxQ/69S10y0tqebUVvXJxdoxWjnlFkn9m5WwPKxlbAzJkzjaNLcLTx+AZFKoPWX4uSmQpPvE+5dPxST8w5rETp9NAT7beXjMqByPsogD9lSdDjqoRtvTXbW2eqwd1ttdqKoz2TgbyEtuvnufN6sNJ0NHon/dWVKsFMm2ClUVQXOJYlpVA4FLbies44BzA3RIa0j2XiicqcOe8rsYeqAsLiWwUhwoTtZqGqIvHmeWzO4Vx2ws8Lu76VaX5fMaT3co9ITqTBah28fc/2a1gZGalw0DR2/RnZa7W+NTHoKIRLTyXcOM2HzTK9LP7tNn45SAyvxUC5dTyLE8zgd0IVSYbrmWNPvkZksgFc/ezbRPL7XoRS97zWS+YBlXNFgQcZD4i26HhY+h0HY=
Content-ID: <D63442B0F753BB4099B330FF67A899F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fc2cb2-c411-46e1-1863-08d737c51a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 21:06:39.0324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yArnJS7jw01VkzE2dcP/G7+Tl6Uebg5Tw3ALBXrLVHEyx7QfEPWtvsh1B5n0JAiiGx3vuYmRUhFjD5v0acdPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAl4/nl6vVTxFCHdi9XIv+p5Zd9BjBzvlJAvRTALbHs=;
 b=iGkfwVKlW8/a1qhjArN8QM5eAcFFYmPyfcepSteDMSVtpoRqEU1N+XAiYvgXzqwIFutRiPgJR4pSD8659OCd4UrkN9BuriaHRjqRBl+S76/SPE5a7jW4pW5btNnKXH/1c4/JTuFG/F+Oom7YUlNw/74yAoIacEVV8oyxhpjnOmY=
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

T24gMjAxOS0wOS0xMCAzOjU5IHAubS4sIFJ1c3NlbGwsIEtlbnQgd3JvdGU6DQo+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgZTAxZjJkNDE4OTUxMDJkODI0YzZiOGY1ZTAxMWRkNWUyODZkNWU4Yi4NCj4N
Cj4gVkcyMCBkaWQgbm90IHJlcXVpcmUgdGhpcyB3b3JrYXJvdW5kLCBhcyB0aGUgZml4IGlzIGlu
IHRoZSBWQklPUy4NCj4gTGVhdmUgVkcxMC8xMiB3b3JrYXJvdW5kIGFzIHNvbWUgb2xkZXIgc2hp
cHBlZCBjYXJkcyBkbyBub3QgaGF2ZSB0aGUNCj4gVkJJT1MgZml4IGluIHBsYWNlLCBhbmQgdGhl
IGtlcm5lbCB3b3JrYXJvdW5kIGlzIHJlcXVpcmVkIGluIHRob3NlDQo+IHNpdHVhdGlvbnMNCj4N
Cj4gQ2hhbmdlLUlkOiBJMmQ3YzM5NGNlOWQyMDVkOTdiZTZhY2ZhNWVkYzQ2MzU5NTFmZGFkZg0K
PiBTaWduZWQtb2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBhbWQuY29tPg0KDQpS
ZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyB8IDYgLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+IGluZGV4IDJkMTcxYmYwN2FkNS4uZGFmZDliN2Qz
MWQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiBAQCAt
MzA4LDEzICszMDgsNyBAQCBzdGF0aWMgdm9pZCBuYmlvX3Y3XzRfZGV0ZWN0X2h3X3ZpcnQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgbmJpb192N180
X2luaXRfcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gLQl1
aW50MzJfdCBkZWYsIGRhdGE7DQo+IC0NCj4gLQlkZWYgPSBkYXRhID0gUlJFRzMyX1BDSUUoc21u
UENJRV9DSV9DTlRMKTsNCj4gLQlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBQQ0lFX0NJX0NO
VEwsIENJX1NMVl9PUkRFUklOR19ESVMsIDEpOw0KPiAgIA0KPiAtCWlmIChkZWYgIT0gZGF0YSkN
Cj4gLQkJV1JFRzMyX1BDSUUoc21uUENJRV9DSV9DTlRMLCBkYXRhKTsNCj4gICB9DQo+ICAgDQo+
ICAgc3RhdGljIHZvaWQgbmJpb192N180X2hhbmRsZV9yYXNfY29udHJvbGxlcl9pbnRyX25vX2Jp
ZnJpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
