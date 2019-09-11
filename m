Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF02AF4A7
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFD96E9A5;
	Wed, 11 Sep 2019 03:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59C6E9EA
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os//mDS7jC4fXDESDhEMVtaFmlB1598wwQCJjAU/c5/E7Avbvf07z9+bUtKqRAr8f+G5B/o9wzCMTbAhOdjxswoat6lViU1PjUZu+Lqp389SR0LX/fQVcwCC44mk9OlwUjdWWwfNfYR2gB1KYxg+ByVYP6tfjrZVJb25LlCZMTVWMl6ZyMbVjgCnnrhUMcMXLib1Y+e+jTbfRWwIDto4jYZaHPIdzu2XNz+PxRzyFmCkKPW6SyFnFyuDu9V8gJg7OoK68TkHKZsLRswPCq6LpP0pCgzJeodSAXCIWhJcW7oZ9gW/i+wunP8VRdphh9/0M+s4ozN8FADXrGVeYb03Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8WPwwNY6lZazuJzM1Yn/iKt8lCh9CJg21VskuHaVbE=;
 b=RvfBpJFoiFuiIlvMIoU2QmvBr01Fs+BuQ48B/MpLZNCM60Zzp76ZnsYpHvE5URvNZwrllLrBdaFN5IWg2BSAoHJPpk5r/Tu9oTdgduPCt8bdHYDqR2iHuQhNOo1MQP7zR6OGbEyFTbQfQl3mAY8HbfHKyVFQaMrYZ2uD3RtZpoXC50hpeeabjWEVlL45umZdiEcsX4yG2wjqK0Khs1DisHT12XCgXYdDK5sNJG9vl3yXYCF00D/4/emll1sM98aoBAidQYfPKVbzByspUJNFf4opRMuJR7nkso5LbQ1E3LzsUgSnEHI/bowLcIZPcdNLnY7ziuUbxiXLqlLUBqBAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2726.namprd12.prod.outlook.com (20.177.124.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:21:02 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:21:02 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 0/4] drm/amdgpu: add pcie bif ras query functionality
Thread-Topic: [PATCH 0/4] drm/amdgpu: add pcie bif ras query functionality
Thread-Index: AQHVaE/w1l/oDq06KUawffv7mOJADQ==
Date: Wed, 11 Sep 2019 03:21:02 +0000
Message-ID: <20190911032016.10313-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e52d1398-8991-4967-f7da-08d7366712d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2726; 
x-ms-traffictypediagnostic: BYAPR12MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27269B8E954F659E04CC7804F1B10@BYAPR12MB2726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(102836004)(99286004)(66476007)(110136005)(316002)(54906003)(4744005)(6436002)(26005)(305945005)(7736002)(6512007)(52116002)(36756003)(66946007)(71190400001)(71200400001)(86362001)(8936002)(5660300002)(81166006)(53936002)(81156014)(50226002)(8676002)(2501003)(1076003)(256004)(6116002)(14454004)(6506007)(6486002)(3846002)(2616005)(66556008)(386003)(486006)(25786009)(476003)(186003)(4326008)(66066001)(478600001)(66446008)(64756008)(6636002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2726;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gCl22KcR8YFn6jPN2smu3ZbOB2gcd7LJGLfkRHNTk1JXHImJz1Aii9dREWa2uhPVJyCbPCUhXz3bLM+NkzD1+rzJ714AUAEJ78fNOTJb2UgllL7+sHWummpMtDgBFffTX4VpF5u0d6X7I204Lf4ArAxizeip2TRf9KyBVzuHM8uLk6x6KWh+0g0gaPV497wjtINIeMSY7CvB1bbTbwLT3zvX+xq/tKaRjjhDQG29vxFeUB4YGmCu4ZbWrDEdg5fx2deuFfLmnHBf5M7vdI0XFRjjehdYptlFCBS28LOrp3Ixj8vKthBkmm50A39J2s7uTKhamtx/HVHh7lmTKGLYbwWNKy9Np2lAC/83iy77O9Q5sjNmvc4L7AdtFW9BPy6HSA0U6lu3pzyxskiQT0N5ZQYjI4w+HScLmOiILu1/Uos=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52d1398-8991-4967-f7da-08d7366712d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:21:02.5648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGsCU7OUUs40+AgdgF5PBoDlOE4NpFWdUytohFBtMNhFEDyFB7L51+GHAD0rfORlWf/Vd+08laNgYk5ZPLuDEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8WPwwNY6lZazuJzM1Yn/iKt8lCh9CJg21VskuHaVbE=;
 b=XNQ5JX4G4FHCXrMWzlSsXNbDyPypVul0GZJt1xwgxkXro5f8v6of8KbPMJidDkl7nk5/lr6l2CV7cVq1a6NBBvNHcCyEUtdSKQPQ+vzDJBqMlZO7UMjSx8S9bAvWUra8FRQG05vdwFk4sQYTw4j9UzN2kwHtuSY1A2Vy/I5h7sI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhcmUgaW1wbGVtZW50ZWQgZm9yIHJhcyBpbmplY3QvcXVlcnkgZXJyb3Ig
aW4gUENJRSBCSUYKYmxvY2suCgpHdWNodW4gQ2hlbiAoNCk6CiAgZHJtL2FtZGdwdTogYWRkIHJh
cyBlcnJvciBxdWVyeSBjb3VudCBpbnRlcmZhY2UgZm9yIG5iaW8KICBkcm0vYW1kZ3B1OiBzdXBw
b3J0IHBjaWUgYmlmIHJhcyBxdWVyeSBhbmQgaW5qZWN0CiAgZHJtL2FtZGdwdTogYWRkIHBjaWUg
YmlmIHJhcyByZWxhdGVkIHJlZ2lzdGVycwogIGRybS9hbWRncHU6IGltcGxlbWVudCByYXMgcXVl
cnkgZnVuY3Rpb24gZm9yIHBjaWUgYmlmCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X25iaW8uaCAgICAgIHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jICAgICAgIHwgIDUgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3
XzQuYyAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrCiAuLi4vaW5jbHVkZS9hc2ljX3JlZy9u
YmlvL25iaW9fN180XzBfc21uLmggICAgfCAxMiArKysrKysKIC4uLi9pbmNsdWRlL2FzaWNfcmVn
L25iaW8vbmJpb183XzRfc2hfbWFzay5oICB8IDQzICsrKysrKysrKysrKysrKysrKysKIDUgZmls
ZXMgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
