Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA07DA8F
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3736E50E;
	Thu,  1 Aug 2019 11:48:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690087.outbound.protection.outlook.com [40.107.69.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DBC6E50E
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXOjfuUzEoOErEgdT91YQmjecztQ66mZV3PgPvqpX/P6kRhFg2jMxqEfN8zM713tkwq9bqXU6fpnczk2cZhwaw5a9PIeGVaYxHIEAI+YmGN/ZBDETDsFPcSOxcez3DIZuQiD7WQecvu56qgsVjSKjLOK8IN8Mt6LnyIJntrr/ZDJO+0MxaVGmrJMmuuvHG2uqhVXNWCwvvXFdWl60UdtirQPC/eE+be+1ltglAR8+BtP8jUZ1PS7sOUbXrqtJGZ8PaAWkaEAMaGt6tCYE/PKqxfdTmiDicjYOF/eFWYGbLWHBzuyDhmtgVBI1AFHTKzK+aa0jmd72ulDZJz1R3I4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6taiz1L6apdn1cq7/+oxQ0fe+ZCiHGJqQ96gzAB3m9o=;
 b=ScEVPm3PpD8SHIRm1cfJDG38dhk+iWbav8wVEvXoqogiz5jcYcqxr1SYZJeYJGD9fySyn0qYE06uTjYg1bhl3HfunOMbPKP0L6h1YVyAeMx0y2JMkx3ogMO1ria9EAQRuwGgfgO3xl0OJst6GGAX1wFbj3V27odKcZTqsG6sEVN0mu2wxz426GiMio1p1MPvs9yyvc8WCdmpwW9nj+9az7nYZBGtAkvt+YIhiWJJZYLbgoRTEp62CUOEA8i8cdiUDcNZ60aRwr0LyjeogDyBrFI4AmxRoByrjY3Gt+S+AW8G+ryjmscz5YhlmoDigJBbqErnmkun7Fue+/Ecl0luUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1890.namprd12.prod.outlook.com (10.175.101.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 11:48:44 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 11:48:44 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4
Thread-Topic: [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4
Thread-Index: AQHVSF8SYAUYhjAWz0SMxbNnCseh1A==
Date: Thu, 1 Aug 2019 11:48:44 +0000
Message-ID: <20190801114828.12273-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33f4bb7d-a6b2-46d8-9b13-08d71676348a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1890; 
x-ms-traffictypediagnostic: BN6PR12MB1890:
x-microsoft-antispam-prvs: <BN6PR12MB189030D01794FBB0E3508E2F85DE0@BN6PR12MB1890.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(26005)(6512007)(316002)(256004)(486006)(68736007)(6116002)(3846002)(6436002)(50226002)(25786009)(2616005)(6486002)(476003)(478600001)(305945005)(66066001)(53936002)(14454004)(6916009)(7736002)(4326008)(71200400001)(2906002)(99286004)(86362001)(102836004)(36756003)(386003)(6506007)(71190400001)(66556008)(64756008)(5640700003)(52116002)(66946007)(186003)(66476007)(66446008)(8936002)(1076003)(8676002)(81166006)(2351001)(5660300002)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1890;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pSG4p9yBpb3DKrhWYzUsz0vpJUcXwJfXl2a0LZ9V3c3i49an8UrgjhiYYbGS8Hh6IDtQ7sbCyxn8TPzj9TYjJSpJ6c8SKPr00fSt4n1unwRHdiHz0jtBRsLOcFgEK+A52HpRvw3uDrLkogqzwOcyksPChYnXHUSFb9RORr616C32G3sXr334Qmnst1U9drp0jr7FArsg3JDHo9fXZ9b7ZUi0Mi4M234cBYgBlwGNKEzGBLDeC6osflZbNUgUiiTJYnBg2iiQzSEhX8K6rnbhgmBbsEej94OPbbDiNuJ8WlJ7CQpckIQFsv8cDCqfKm3/l6a+Ya0C88IBdK4OV5sEyh41LaFPKHl2ijvtxYZLNhWi65ciV5ZkGYB8de6nOnOybrFI+ccR5tY2sVWI6fHsYG7CewOjLD2nxve9HjjdSaw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f4bb7d-a6b2-46d8-9b13-08d71676348a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 11:48:44.1834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1890
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6taiz1L6apdn1cq7/+oxQ0fe+ZCiHGJqQ96gzAB3m9o=;
 b=QODqhcGefBxCdEM17Ag+SCEFE4bb133JLKRCS3TosCoxplb0yvpJ+XIbQUl5T3VCiHIAFRplTByDTxUUQ8Z6Z7EQu8FrtyZbAmWYGvSk2BNdSq1P6pYwROLCylzfG4SLqeuflOa8hD8RZxzFsNVTSJO8Hj4KlxYooz7XLAmq7uQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIGFkZGVkIGZvciBWRzIwLCBhbmQgYXJlIG5lZWRlZCBmb3IgUENJZSBiYW5kd2lk
dGguCgpDaGFuZ2UtSWQ6IEk1NDQ3NGJiNTNlZDU2M2QwODM1MjFkMjQ5NDRmNWY5N2QzNzJmMDAx
ClNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Ci0tLQog
Li4uL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9zaF9tYXNrLmggIHwgMzAgKysrKysr
KysrKysrKysrKysrKwogLi4uL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21u
LmggIHwgIDYgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBf
c2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJp
b183XzBfc2hfbWFzay5oCmluZGV4IDg4NjAyNDc5YTFhYS4uZWU4YzE1ZTQ1NDNkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9z
aF9tYXNrLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8v
bmJpb183XzBfc2hfbWFzay5oCkBAIC03NDcwOSw2ICs3NDcwOSwzNiBAQAogLy9QQ0lFX1BFUkZf
Q09VTlQxX1RYQ0xLMgogI2RlZmluZSBQQ0lFX1BFUkZfQ09VTlQxX1RYQ0xLMl9fQ09VTlRFUjFf
X1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAweDAKICNkZWZpbmUgUENJRV9QRVJGX0NPVU5UMV9UWENMSzJfX0NPVU5URVIx
X01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMHhGRkZGRkZGRkwKKy8vUENJRV9QRVJGX0NOVExfVFhDTEszCisjZGVmaW5l
IFBDSUVfUEVSRl9DTlRMX1RYQ0xLM19fRVZFTlQwX1NFTF9fU0hJRlQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MAorI2RlZmlu
ZSBQQ0lFX1BFUkZfQ05UTF9UWENMSzNfX0VWRU5UMV9TRUxfX1NISUZUICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDgKKyNkZWZp
bmUgUENJRV9QRVJGX0NOVExfVFhDTEszX19DT1VOVEVSMF9VUFBFUl9fU0hJRlQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxMAorI2Rl
ZmluZSBQQ0lFX1BFUkZfQ05UTF9UWENMSzNfX0NPVU5URVIxX1VQUEVSX19TSElGVCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDE4Cisj
ZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLM19fRVZFTlQwX1NFTF9NQVNLICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAw
MDAwRkZMCisjZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLM19fRVZFTlQxX1NFTF9NQVNLICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4MDAwMEZGMDBMCisjZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLM19fQ09VTlRFUjBf
VVBQRVJfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDB4MDBGRjAwMDBMCisjZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLM19f
Q09VTlRFUjFfVVBQRVJfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4RkYwMDAwMDBMCisvL1BDSUVfUEVSRl9DT1VOVDBfVFhD
TEszCisjZGVmaW5lIFBDSUVfUEVSRl9DT1VOVDBfVFhDTEszX19DT1VOVEVSMF9fU0hJRlQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4MAorI2RlZmluZSBQQ0lFX1BFUkZfQ09VTlQwX1RYQ0xLM19fQ09VTlRFUjBfTUFTSyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweEZGRkZGRkZGTAorLy9QQ0lFX1BFUkZfQ09VTlQxX1RYQ0xLMworI2RlZmluZSBQQ0lFX1BF
UkZfQ09VTlQxX1RYQ0xLM19fQ09VTlRFUjFfX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKKyNkZWZpbmUgUENJRV9Q
RVJGX0NPVU5UMV9UWENMSzNfX0NPVU5URVIxX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhGRkZGRkZGRkwKKy8vUENJ
RV9QRVJGX0NOVExfVFhDTEs0CisjZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLNF9fRVZFTlQw
X1NFTF9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDB4MAorI2RlZmluZSBQQ0lFX1BFUkZfQ05UTF9UWENMSzRfX0VWRU5U
MV9TRUxfX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDgKKyNkZWZpbmUgUENJRV9QRVJGX0NOVExfVFhDTEs0X19DT1VO
VEVSMF9VUFBFUl9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMHgxMAorI2RlZmluZSBQQ0lFX1BFUkZfQ05UTF9UWENMSzRfX0NP
VU5URVIxX1VQUEVSX19TSElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAweDE4CisjZGVmaW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLNF9f
RVZFTlQwX1NFTF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwRkZMCisjZGVmaW5lIFBDSUVfUEVSRl9DTlRM
X1RYQ0xLNF9fRVZFTlQxX1NFTF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMEZGMDBMCisjZGVmaW5lIFBDSUVf
UEVSRl9DTlRMX1RYQ0xLNF9fQ09VTlRFUjBfVVBQRVJfTUFTSyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDBGRjAwMDBMCisjZGVm
aW5lIFBDSUVfUEVSRl9DTlRMX1RYQ0xLNF9fQ09VTlRFUjFfVVBQRVJfTUFTSyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4RkYwMDAw
MDBMCisvL1BDSUVfUEVSRl9DT1VOVDBfVFhDTEs0CisjZGVmaW5lIFBDSUVfUEVSRl9DT1VOVDBf
VFhDTEs0X19DT1VOVEVSMF9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MAorI2RlZmluZSBQQ0lFX1BFUkZfQ09VTlQw
X1RYQ0xLNF9fQ09VTlRFUjBfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweEZGRkZGRkZGTAorLy9QQ0lFX1BFUkZfQ09V
TlQxX1RYQ0xLNAorI2RlZmluZSBQQ0lFX1BFUkZfQ09VTlQxX1RYQ0xLNF9fQ09VTlRFUjFfX1NI
SUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDAKKyNkZWZpbmUgUENJRV9QRVJGX0NPVU5UMV9UWENMSzRfX0NPVU5URVIxX01B
U0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHhGRkZGRkZGRkwKIC8vUENJRV9QUkJTX0NMUgogI2RlZmluZSBQQ0lFX1BSQlNf
Q0xSX19QUkJTX0NMUl9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKICNkZWZpbmUgUENJRV9QUkJT
X0NMUl9fUFJCU19QT0xBUklUWV9FTl9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxOApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21uLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9zbW4uaApp
bmRleCBjYWY1ZmZkYzEzMGEuLjY3MDI1NzViYzZlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21uLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21uLmgKQEAgLTUw
LDYgKzUwLDEyIEBACiAjZGVmaW5lIHNtblBDSUVfUEVSRl9DTlRMX1RYQ0xLMgkJCTB4MTExODAy
NTQKICNkZWZpbmUgc21uUENJRV9QRVJGX0NPVU5UMF9UWENMSzIJCQkweDExMTgwMjU4CiAjZGVm
aW5lIHNtblBDSUVfUEVSRl9DT1VOVDFfVFhDTEsyCQkJMHgxMTE4MDI1YworI2RlZmluZSBzbW5Q
Q0lFX1BFUkZfQ05UTF9UWENMSzMgICAgICAgICAgICAgICAgICAgICAgICAweDExMTgwMjFjCisj
ZGVmaW5lIHNtblBDSUVfUEVSRl9DT1VOVDBfVFhDTEszICAgICAgICAgICAgICAgICAgICAgIDB4
MTExODAyMjAKKyNkZWZpbmUgc21uUENJRV9QRVJGX0NPVU5UMV9UWENMSzMgICAgICAgICAgICAg
ICAgICAgICAgMHgxMTE4MDIyNAorI2RlZmluZSBzbW5QQ0lFX1BFUkZfQ05UTF9UWENMSzQgICAg
ICAgICAgICAgICAgICAgICAgICAweDExMTgwMjI4CisjZGVmaW5lIHNtblBDSUVfUEVSRl9DT1VO
VDBfVFhDTEs0ICAgICAgICAgICAgICAgICAgICAgIDB4MTExODAyMmMKKyNkZWZpbmUgc21uUENJ
RV9QRVJGX0NPVU5UMV9UWENMSzQgICAgICAgICAgICAgICAgICAgICAgMHgxMTE4MDIzMAogCiAj
ZGVmaW5lIHNtblBDSUVfUlhfTlVNX05BSwkJCQkweDExMTgwMDM4CiAjZGVmaW5lIHNtblBDSUVf
UlhfTlVNX05BS19HRU5FUkFURUQJCQkweDExMTgwMDNjCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
