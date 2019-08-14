Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB88DBEA
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 19:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ED36E7A2;
	Wed, 14 Aug 2019 17:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921BB6E79C
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 17:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPEmULCbTwmB4mroOaGStVdv9AvWQzhAQRqO9q9w/N9E4hb1vF0YlAmuuWuyj010BKNYdsUNyjW73d/VTTThNejSFSxdoF81sxdkAwPP6bo5hRoZglHhcjiuFDCv4APqKguC6pdSCEod/YqVWV5BU/V17qCZ+anZZfrCbKQNC7EpLdSp9frp8RTPEMgMvUAb6fZ+giwjmF+t06RJMmQxsnmmv/9X8wNlP2mNdoiXUyxBoRPLsWENzoe4AwRV/aP+kPAsG0SGNlSn9G2InNJanfccNk4k75I32oPnsES2EtavLwSK/huoGcQFOUYXDLCr7czxMA3wHvW/y9TPGPUf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wZlZOBN3bc/pgkihlJpURA6onCmqWQepWPYAJTebwA=;
 b=GiGHR0gJLY6NNkqSD2l2kKfo0OCm3ohvx7M1Z01BRZGpKFUTX81SpgVLWbqUufibDVLh/NZwNT3vVcPnYCxXLv/FP7WchADHinQUs5cwKAqTdLvK/tCWL2zuMQghw5/mIVG2ZTU/lYHFMpqnZcu9nZcq+jC/gND/lvsRFPwfqE9z8OfqsFLCh/twT9h2h+zeBo8Gkgn34k/EZQ3bNxoPACXjPV8jciq+cB3QHQuI3QsfWkE4yMIYIkzxkKVJbeY6NKwiV7LUi3S5Di2Ugu5cIPnjRHcKae+AtQYuBk0qP+P3dkBPmObILiHHngVimlUbT0obB3BeBDepx82tPpZ6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1698.namprd12.prod.outlook.com (10.175.101.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 14 Aug 2019 17:32:11 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 17:32:11 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Update VM function pointer   When VM state
 changed and system in large bar mode, make sure to use CPU update function, 
 otherwise use   SDMA function.
Thread-Topic: [PATCH] drm/amd/amdgpu: Update VM function pointer   When VM
 state changed and system in large bar mode,   make sure to use CPU update
 function, otherwise use   SDMA function.
Thread-Index: AQHVUsY0evRgsOuE+kGxNegATnkZOw==
Date: Wed, 14 Aug 2019 17:32:10 +0000
Message-ID: <1565803920-20816-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1afeaa1-74a2-431a-90ee-08d720dd5672
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1698; 
x-ms-traffictypediagnostic: BN6PR12MB1698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB169851DE4C0E8F2E6B90692AFFAD0@BN6PR12MB1698.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(4326008)(256004)(52116002)(7736002)(4744005)(6486002)(14454004)(14444005)(8676002)(2501003)(305945005)(5660300002)(6916009)(71190400001)(71200400001)(2906002)(6436002)(6116002)(316002)(5640700003)(3846002)(66946007)(53936002)(6506007)(2351001)(15650500001)(50226002)(476003)(64756008)(8936002)(486006)(66556008)(36756003)(186003)(81166006)(66066001)(2616005)(26005)(99286004)(66476007)(81156014)(102836004)(25786009)(386003)(6512007)(478600001)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1698;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mEegPOGaxqwjBSz6MIkTOre3Vtb+xXbZGNWbhN74T8NOkohDfVzTLGmV4bAn6emGEXGxmsO4ZsxRbnthakA1fIw+2SKdD3ZdjoxUiiolZFA6AjvPYlU9miI+r903u7R180jdoBGpsvvqAZXuVsgT0JssvNLnIuMXxse3daM3AF7tj+heYndWNHm6Cxi8/I1ST1OUd3NkU0p+P/aWBYbvIuI+PhS9HGoHcMD35cbiIaVUmZzb40YNr9yrfHAyeRDZ5Wq33JVJ6lksu3/3elpQvXQ6hyapB3ySVsyPo1uYUFffWOjMADhskcKLNqRAykHKTtaCEWXlBsQm27xEmNQo+1ydlexpAi7TQEvOBAeVr95ug/CDzzi+9zy+mACZkPPUOtdhQaPHUXewYzLochbz/BGgo0Vl199hBJ4xKTjeSuc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1afeaa1-74a2-431a-90ee-08d720dd5672
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 17:32:10.8893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIifWTuPizSxTDqPQ/6sX0ECh0p5sjXtEiRpn4fBcQ2Bn0wYq1jDXKh+KY07rd1R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wZlZOBN3bc/pgkihlJpURA6onCmqWQepWPYAJTebwA=;
 b=CfbKeRrXigX47mm1b1s9Sl6WzOCoTg64jPydOrxeXBTphdcludhdIk0WSImWhouyQUTuV+sQ33LroGUT+J+kPExH6EULjIS2p0ONwPlH2HHgxo9fqnKeMeKQPQC8VEftUyMoFx+G6/sokCCnt08M2J2FSXffJE80QnHB8nznh1g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYmNmYWRhNTYwYTAwYzlhZWViZmQ5MjJhZTQ4ZGU5MjBlNDRhNTg2NgpTaWdu
ZWQtb2ZmLWJ5OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggYzFiYWYz
ZC4uNzJkZDQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTI4
NjIsNiArMjg2MiwxMiBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVucwogCVdBUk5fT05DRSgodm0t
PnVzZV9jcHVfZm9yX3VwZGF0ZSAmJiAhYW1kZ3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgmYWRl
di0+Z21jKSksCiAJCSAgIkNQVSB1cGRhdGUgb2YgVk0gcmVjb21tZW5kZWQgb25seSBmb3IgbGFy
Z2UgQkFSIHN5c3RlbVxuIik7CiAKKwlpZiAodm0tPnVzZV9jcHVfZm9yX3VwZGF0ZSkKKwkJdm0t
PnVwZGF0ZV9mdW5jcyA9ICZhbWRncHVfdm1fY3B1X2Z1bmNzOworCWVsc2UKKwkJdm0tPnVwZGF0
ZV9mdW5jcyA9ICZhbWRncHVfdm1fc2RtYV9mdW5jczsKKwl2bS0+bGFzdF91cGRhdGUgPSBOVUxM
OworCiAJaWYgKHZtLT5wYXNpZCkgewogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwogCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
