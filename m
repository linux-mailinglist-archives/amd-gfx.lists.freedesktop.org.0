Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6FE5D489
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 18:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C66899A3;
	Tue,  2 Jul 2019 16:46:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDC0899A3
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 16:46:57 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3256.namprd12.prod.outlook.com (20.179.93.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 16:46:55 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 16:46:55 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix interrupt client id for navi
Thread-Topic: [PATCH] drm/amdgpu/display: fix interrupt client id for navi
Thread-Index: AQHVMPWo4l6sXOtPuEK2cImcVSHqTqa3iZQA
Date: Tue, 2 Jul 2019 16:46:54 +0000
Message-ID: <74d232f3-205f-a6ba-fb36-e7ccea1b206a@amd.com>
References: <20190702164558.24846-1-alexander.deucher@amd.com>
In-Reply-To: <20190702164558.24846-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2ddec23-d9f9-4a20-4f3d-08d6ff0ce3bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3256; 
x-ms-traffictypediagnostic: BYAPR12MB3256:
x-microsoft-antispam-prvs: <BYAPR12MB32568C7AA75DA8363FBC1563ECF80@BYAPR12MB3256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(189003)(199004)(31696002)(6246003)(305945005)(86362001)(256004)(7736002)(72206003)(66446008)(478600001)(36756003)(8676002)(64756008)(66946007)(229853002)(66066001)(446003)(81156014)(81166006)(71200400001)(6512007)(53936002)(73956011)(66556008)(6486002)(71190400001)(2501003)(6436002)(486006)(110136005)(2616005)(476003)(14454004)(5660300002)(186003)(26005)(68736007)(11346002)(386003)(316002)(53546011)(8936002)(6506007)(102836004)(31686004)(4326008)(25786009)(76176011)(99286004)(3846002)(52116002)(6116002)(66476007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3256;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hu2DBa98vJHfiCF5B9LWz2EtJgYq1LpGrOqQvcwT1QF8Nfs7DFO8KJCFQlbqyPnEIDaYw/ZNvjvfUQ1tnGwEXBOchfyQrZ+lRs1W0vknyzxQqFJH8KYlYZFQzQCZ0jF/YfTVSTL/6/5pzgEgL1AmBl/6274WzseEtQKwDnZ9ZJ9qBXpeLUMqX1Qb+ER8703/nuTW6lMuucEGVvH6mHsNujW9+lb72VbFdP9o/XWBLhUkS70bHCgWe239rqOwIO642+PIZNuiKHfv0rAWIwO/4ppAWRCiL6XH1XJlwc+rpJpDNWorgDxtZkPTxpHw92s4N1KwH+0q4jLDHGrTXUv7CvcyBcJn+mzjdhvoj/Cnv2Yp9fUhTJ9YYp4cM4o/JqcysaHDinW9Xc63+0f0wUkTD44i1VaNrRK59SSJXxB1e2o=
Content-ID: <69399A36A567434EB629F3D6BCDDDDCA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ddec23-d9f9-4a20-4f3d-08d6ff0ce3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 16:46:55.3382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7TZ5ABeycTRZjioggmhEiThAyIgXsl1+X2NoKsymQ0=;
 b=NddU1VG48QsVTWD31ybWj99UzLe2i6q6qUBdR7cUXOkyXxiBc/tTzZkOo6zpp1GJqhYz2vtycIbcYuI+Nxa6n0u49DEdDR7vml3KVKmNbMNNSX5cho8vGudTlLa1NhIPnRVeip6DTKsRrj6avd5zZ/h+bGv/tn1D3sWxnNpDM5o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy8yLzE5IDEyOjQ1IFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IEFsbCBhc2ljcyBuZXdl
ciB0aGFuIHZlZ2ExMCB1c2UgY2xpZW50IGlkcywgc28gc2ltcGxpZnkgdGhlDQo+IGNoZWNrLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KDQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1ICstLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IGNlZjQ0Y2U4MDk5Zi4u
YmU1YTU2MTBjMTY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTE1MzMsMTAgKzE1MzMsNyBAQCBzdGF0aWMg
aW50IGRjZTExMF9yZWdpc3Rlcl9pcnFfaGFuZGxlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpDQo+ICAgCWludCBpOw0KPiAgIAl1bnNpZ25lZCBjbGllbnRfaWQgPSBBTURHUFVfSVJRX0NM
SUVOVElEX0xFR0FDWTsNCj4gICANCj4gLQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVH
QTEwIHx8DQo+IC0JICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0ExMiB8fA0KPiAtCSAg
ICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAgfHwNCj4gLQkgICAgYWRldi0+YXNpY190
eXBlID09IENISVBfUkFWRU4pDQo+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0Ex
MCkNCj4gICAJCWNsaWVudF9pZCA9IFNPQzE1X0lIX0NMSUVOVElEX0RDRTsNCj4gICANCj4gICAJ
aW50X3BhcmFtcy5yZXF1ZXN0ZWRfcG9sYXJpdHkgPSBJTlRFUlJVUFRfUE9MQVJJVFlfREVGQVVM
VDsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
