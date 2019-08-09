Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C603087050
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4C26ECF5;
	Fri,  9 Aug 2019 03:50:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9F06ECF5
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JogfnVn1H+SzCsU0Xnj3l8hg4KlhI0BEv6VernKrWdbEh/47ZYpcGwaFL899kfd2C1QdgZhkMt0f9snO1HyZNSIabzzjySRwh3ro25eJyVfmvZG82rdIEIVPZ3qs/Wmsw34hrTvZXoqRrWUPNImjlLE1N8ZANAqGR6vU43lMnmqae+U7P6DPhBa4CWxHH9dP9pb5zYvngpqHVOdw8ptdGEMstc67N6eKzNRvbweq1Y7MqZJk+cKJXL5p3xwagTXS+IiCeByVn9OlFCsThizRVwt0ETsFAG0Pi56R6MAdusHzXIQwAr9Nxm1zwA3rfRqUSMCHik9lIf9yBlz3Mf/ldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=711rAZTUCl1rKOPK6ZuwOxrP2+crsJwckChnh8Yvnb8=;
 b=YptHkVnZtoMArEjiXX+psaFmjsPBTjZKi2Un2XbileYe1DxuuQl97PBbEpjDfhNpv1SJ4SVQ8QuBjpWOnM7QMZNep2Ccmn8ZOdAqjLlLj4QfRf/SB6r5NHWmaCSp4WjAheGpK+NdC/OAOy/1QoRPbA/12NvFUYZbslJZcIkH27LrTojw8w289ZIs5yBFJ4jtesRw8R8P6lwm+PfUY7WS3ARWMcvl2x0KyAB9eml6sEBvGB9zNx78yYEVLc7GQgyicR8qCxpfEopgDSXf6NuocWJ6aDRoOpYFiVUuBIIaZltLvwENpYQj1rNmsUYFiIUV+yyWUFs4mOp5cBqhToI2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3981.namprd12.prod.outlook.com (10.255.238.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 03:50:28 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:50:28 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/9] drm/amdgpu: enable hdp clock gating for Arcturus
Thread-Topic: [PATCH 4/9] drm/amdgpu: enable hdp clock gating for Arcturus
Thread-Index: AQHVTdMmmkfluvAphUauojxGLL/TJqbyL3cQ
Date: Fri, 9 Aug 2019 03:50:28 +0000
Message-ID: <MN2PR12MB3598B14949C72C785EC6938A8ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-4-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-4-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dbbe4f5-e724-45e8-97dc-08d71c7cb83f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3981; 
x-ms-traffictypediagnostic: MN2PR12MB3981:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39818BF00906896E269944DA8ED60@MN2PR12MB3981.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(13464003)(2501003)(66556008)(64756008)(305945005)(76116006)(6436002)(14454004)(99286004)(446003)(476003)(7736002)(102836004)(26005)(81156014)(33656002)(66476007)(66946007)(14444005)(256004)(81166006)(5660300002)(316002)(86362001)(110136005)(6116002)(3846002)(229853002)(2906002)(71190400001)(71200400001)(66066001)(74316002)(25786009)(55016002)(7696005)(486006)(6306002)(53546011)(9686003)(4326008)(8936002)(11346002)(6246003)(186003)(8676002)(6506007)(478600001)(66446008)(52536014)(76176011)(966005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3981;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3v3CN4jSTzUnsnpjWiNpxj1yzdMxWlw/PH3fP5lXcL2oafV28qQeFiu/yghzewsKvKXG4uV4GrvWldKkvXJWIvk+JttKURrp83Jovs7EvgT/tjZY5rPk8c4woJcW9pA5kpLPcdoONzL/C/CgSKk9ADMh+vZdY54gVpNJhPnzlamM2khWC+EJby2kHpOrbFiJ1Kn+uRjeGJyP5O0MkJq+i1L2Ox0C3lHnxd3zt8208a8JeCsT7LbeFOTcH1FHvAHxr0BVBSHJ/kns/hNmTcrUnWsUPFsYNJ38u0x+zN4C+BiJ6Sfg0xTk6hD7vb8C7oGl7Si8KGx3WFZWHrK1o1I/9CSqrhMDrsW2qnFfmrygausyVwbtHq1Oq2TQgyH3f1HVnUil/t+PwJIAcu6B2IFXM6TmH/27YVBKeDG6yiorMYI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbbe4f5-e724-45e8-97dc-08d71c7cb83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:50:28.6583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tM8mE1IZu32YC2Il0qGa7X1xrrH+1JsXjT+lpvEISJ11stzd1RhQQfiiyysddnj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=711rAZTUCl1rKOPK6ZuwOxrP2+crsJwckChnh8Yvnb8=;
 b=GbzGCq7kehtRNw0iP2nhFNByq7bFTVHVJ6q0RhsNZSIP4vgtHEHJD7xg+KMWppLdVOnsdOisjq2Eb9I1udZVrN/SHpFVWMih8Xm+8oYUBFjjYvnMp9z32lw8FHSuG6wYHQtI+Pkdz+laY83KJUMgZSfg/PAy32TB/lfauQzKhtk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IFRo
dXJzZGF5LCBBdWd1c3QgMDgsIDIwMTkgNjoyMiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDQv
OV0gZHJtL2FtZGdwdTogZW5hYmxlIGhkcCBjbG9jayBnYXRpbmcgZm9yIEFyY3R1cnVzDQoNCltD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KSW5pdCBoZHAgTUdDRy9MUyBmbGFnIGFzIFZlZ2Ey
MA0KDQpDaGFuZ2UtSWQ6IElhMzNjYTA2NGY3OWFjNDA5YzUzZDNiZWI2ZjAxYjZlODE0YTkyMDQx
DQpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA0ICsrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0K
aW5kZXggNGZiYWNhMy4uNjAzOGRjZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMN
CkBAIC0xMDE3LDcgKzEwMTcsOSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0
KHZvaWQgKmhhbmRsZSkNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dG
WF9NR0xTIHwNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DR0NH
IHwNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DR0xTIHwNCi0g
ICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUzsNCisgICAgICAg
ICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyB8DQorICAgICAgICAgICAg
ICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8DQorICAgICAgICAgICAgICAgICAg
ICAgICBBTURfQ0dfU1VQUE9SVF9IRFBfTFM7DQogICAgICAgICAgICAgICAgYWRldi0+cGdfZmxh
Z3MgPSAwOw0KICAgICAgICAgICAgICAgIGFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJl
dl9pZCArIDB4MzI7DQogICAgICAgICAgICAgICAgYnJlYWs7DQotLQ0KMi43LjQNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGlu
ZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
