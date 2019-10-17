Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F44DACA2
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 14:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D080F6EA6D;
	Thu, 17 Oct 2019 12:45:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD066EA6D
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 12:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsQ8wHyiDGGKZ9DYnGH1ajIQHMjMtFxubKvhJEXvDTCU7/ltLlZ2nUcLjOj+gzC7lK5MDS4VG7J8HPi8UCRFUYxsCqeuxEhCoi+/EYYsODZ9mBeicevStdYEUmABX5vs/cjqoo4NifXf8T2/ei4Cg7eTRpMP9y7hQEAP5x0LQweFP4A+6qO6ZQItyDBQgQv8wSujd4MVQOALiNa/JbGYT5kuWEZlZs4iBoMQ1tG5bw5LX3p8oSuxAwQ1bXHovwtr3C7fxkIwQ/UzLV5t6EIqdSA1Ou9/FEN7BcvCdoa7L8Qxgv77PK1d24MDlGN3R2rkwKXQn+oJcUYhYzC1jxoOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dciKxJwp6jTImhC8yvTt7Z4AzDaKTjOLV1q8xbyo7IA=;
 b=JKzfqbnkIp5fFAQdVTy1957uk/xENoRJNnte4rxYNTLHlT9BJejA15v5iqbij+kfMjBITdVu77Dmapdf1DLzmI7rMqqccuvZDpfApvd6zp9kP+P4SWuLIRuQRLX8ESHC10y40zjn1ZEa6g0ZIXvb9mm/QSUOpn6zATYNvVRn83UFMXcbVrMniaZvkj6lZUiS9JmzqUtoJpcsQkBWxylegFldbmdm41Lq390xnr5H5hAJP/qkwk1zpem3iS1TccgqErJDBSXkaBifIp/cmBU7Vz3ueA1MewvPBcZpPoTVy9OHjNtcTxfYZb00syIQigqmDvT3B63zYLnfYt2xvpLwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3095.namprd12.prod.outlook.com (20.178.55.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Thu, 17 Oct 2019 12:45:40 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 12:45:40 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Avoid sending abnormal VSIF
Thread-Topic: [PATCH] drm/amd/display: Avoid sending abnormal VSIF
Thread-Index: AQHVhMujdmQOVF4zbkWpdigMsCLZ9adex/MA
Date: Thu, 17 Oct 2019 12:45:40 +0000
Message-ID: <078d3815-a1b2-d636-6431-bba3f2df37c5@amd.com>
References: <20191017091122.8922-1-Wayne.Lin@amd.com>
In-Reply-To: <20191017091122.8922-1-Wayne.Lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::46) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5b5d3bf-d6f2-45f3-85ce-08d752ffea65
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3095:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3095AD734BCC62D366F85E65EC6D0@BYAPR12MB3095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(199004)(189003)(86362001)(6436002)(6486002)(81166006)(71200400001)(31696002)(81156014)(229853002)(4001150100001)(71190400001)(6116002)(3846002)(6512007)(256004)(110136005)(446003)(2616005)(8936002)(25786009)(8676002)(476003)(54906003)(11346002)(486006)(36756003)(316002)(66476007)(478600001)(26005)(4326008)(64756008)(66446008)(66946007)(53546011)(386003)(6506007)(66066001)(186003)(102836004)(2906002)(66556008)(5660300002)(31686004)(6246003)(76176011)(52116002)(99286004)(14454004)(2501003)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3095;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cQ5m+qUcz7VEKn+/lBpUlXGzj0sgdh1K7RiRVjO3n8b3p85mLbKFA7yjO/5Pi20FnT8qMjApKd0TDObmAwhdpNmjn7lVaYTNyX6MXWB4qbLfPK6AMx7KDUeFBPDnOvY3AI5JvN1zs7HwPTpOxzNRxaA2zqUfg/FOnmIHlQcLuObJFz1sQv9o2jqe53Mhb1LMsJSLxncYkt1MUENXEin5M7rg9B3vmQW20PYdwKJXlM7iEPrJ6b3hvBERbV3pLPqgT8eeFgkzdgvq8o+XJy6Kguy9yVwQ9jduUBLOt6ZzlsLkcQB6zUEAExdVPzR+gZ9FmGQGXFpxbdeJhncjP6uc50lhEtqZYfAG3mVDvTi1+tPqPGo7Rw/ryGJ2jg+HqWFIZ1wwRxnmCq+xb68rKmVSLdDA0mf5gr9rAxAUndmU0Xg=
Content-ID: <31BDE8E56D12D045AD15870296C7D33E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b5d3bf-d6f2-45f3-85ce-08d752ffea65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 12:45:40.1343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4Lx1gNgsZsx7AConFNiPPwWXSCjzB+RcsOZMPrD3dFIK12XuneULNz26xODoo/JL6I8ibslGmHhGELa/iZtmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dciKxJwp6jTImhC8yvTt7Z4AzDaKTjOLV1q8xbyo7IA=;
 b=qBVoI7gKpkcTAOS1a7PAlLXWR9UadOwG/Xwb6OYlaTCd1g54zBPfSzrn47ctr3p1xflSNrtCAewkRAJfW0JFGYeYbYjCLu/9CjLejC2nzN2nb2tu/3c3ru/VEcXUZVYwBSysM/pU7EuSNxqTXPK1HsUX7/A0JBHKXUBBTXEKB+c=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xNyA1OjExIGEubS4sIFdheW5lIExpbiB3cm90ZToNCj4gW1doeV0NCj4gV2hp
bGUgc2V0dGluZyBoZG1pX3ZpYywgaHZfZnJhbWUudmljIGlzIG5vdCBpbml0aWFsaXplZCBhbmQg
bWlnaHQNCj4gYXNzaWduIGEgd3JvbmcgdmFsdWUgdG8gaGRtaV92aWMuIENhdXNlIHRvIHNlbmQg
b3V0IFZTSUYgd2l0aA0KPiBhYm5vcm1hbCB2YWx1ZS4NCj4gDQo+IFtIb3ddDQo+IEluaXRpYWxp
emUgaHZfZnJhbWUgYW5kIGF2aV9mcmFtZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGlu
IDxXYXluZS5MaW5AYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMg
PG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0KVGhhbmtzIQ0KDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzICsrKw0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBpbmRleCAxMGNj
ZTU4NDcxOWYuLjMzYTQ1NWM5MGUyNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IEBAIC0zNDcyLDYgKzM0NzIsOSBA
QCBzdGF0aWMgdm9pZCBmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9k
ZSgNCj4gICAJc3RydWN0IGhkbWlfdmVuZG9yX2luZm9mcmFtZSBodl9mcmFtZTsNCj4gICAJc3Ry
dWN0IGhkbWlfYXZpX2luZm9mcmFtZSBhdmlfZnJhbWU7DQo+ICAgDQo+ICsJbWVtc2V0KCZodl9m
cmFtZSwgMCwgc2l6ZW9mKGh2X2ZyYW1lKSk7DQo+ICsJbWVtc2V0KCZhdmlfZnJhbWUsIDAsIHNp
emVvZihhdmlfZnJhbWUpKTsNCj4gKw0KPiAgIAl0aW1pbmdfb3V0LT5oX2JvcmRlcl9sZWZ0ID0g
MDsNCj4gICAJdGltaW5nX291dC0+aF9ib3JkZXJfcmlnaHQgPSAwOw0KPiAgIAl0aW1pbmdfb3V0
LT52X2JvcmRlcl90b3AgPSAwOw0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
