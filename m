Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3242BAD4D
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 06:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6A16E060;
	Mon, 23 Sep 2019 04:30:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8846E060
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 04:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMUEv0Ja36nZJUIiQlOj4ciHJ0tuieEaQden0mzh0UHAjUbwFCMCV17FWBzjO9fzWzdHErDYs2zj1VdRoW0ZvqAL5R533wbYCHHzAFfkFCjeLbqbkKzxqwrmvA9PSy0w3jC+nrhhNqlKzytfUXbb+5Qjoq9XTvx8pIbFEGnwZCVELZ+8XnlVOzK22Siagy6qz3C+T5H8VZd+3L8a1mwFgowOhvoJs6ANbGtYWe1WtNFwgb84eHleeJSr18u7NzE5vQ/EIbW4ZSBeWZ13y+y0SUaKHfMveBfTyjPFYFwxVg/L/vTX+EK5AY1kyhs4o5och8hJuhfOgFooy3FKg3Rfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKyYMkwFprTmqu85nrWgXliNOFWVg81wn6YnqNawcXM=;
 b=SiT+3DUc7vSLjYyD80cu1nyF9JlfPVmiS+ZXgLGC6MhSId+wWS8EIFJxgFAEeXwZ7O0YDDN9zQXMAm2grCyN+S12aoCAST3ZIO4IJX3EmP1CWDY51yQprZFQ0q7PWyuCg8BSKUBGfnpodRBBvPud1Uo4ORUQmYmwDIfA6Y2JGnfybSq2cPOiIRg00OTRoZ8YNQsNOJZWymkuoVxR8zicq/OtBUoflgjnCwxQtTT4Skq0BvMyJkOWxbnfMgkFBeaaWb/FtsR3ZwR6LuIm3/BY/T4SI4urs+urpRSCeouJi2XH5RLbJ+SQvLSBJVTxGJ9com6MzDsPWwx3s48kKKRRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4186.namprd12.prod.outlook.com (10.141.186.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 04:30:00 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 04:30:00 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for non HWS mode
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for non HWS
 mode
Thread-Index: AQHVccePnPIVVsq9GUWt5Tn5L0HPTg==
Date: Mon, 23 Sep 2019 04:30:00 +0000
Message-ID: <20190923042944.15314-3-Yong.Zhao@amd.com>
References: <20190923042944.15314-1-Yong.Zhao@amd.com>
In-Reply-To: <20190923042944.15314-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e17123e5-c454-4ed0-4dac-08d73fdeb212
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4186; 
x-ms-traffictypediagnostic: DM6PR12MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4186039A619831B82EC4871AF0850@DM6PR12MB4186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(66476007)(64756008)(66556008)(66446008)(5660300002)(386003)(8936002)(66946007)(81156014)(476003)(2616005)(11346002)(1076003)(316002)(86362001)(81166006)(6506007)(6916009)(2501003)(66066001)(2906002)(71200400001)(71190400001)(446003)(305945005)(7736002)(14454004)(478600001)(186003)(25786009)(99286004)(50226002)(6116002)(256004)(36756003)(3846002)(6512007)(52116002)(26005)(4326008)(76176011)(8676002)(5640700003)(102836004)(6436002)(2351001)(6486002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4186;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xymKNM4/Lvy+iOZFfytAm3Q5op9jw6x0YKdcr2JuLqaglAUWKl/ZEqeHzbf3QMQUsv3Vannlz3iuhwDsT2CScCJREObjBZqBku4yjbejxPUwLxni7mraeYVTDOJOgHZ8nNpj9tO2Mf+O4RCq2YTS13ZlqqZql8qT2ucVAOAYXh+lpbjsUS72XC5E+T/xgVTqxeBaejTP5tQDFsYzG/b7wiHhlWYDiBrydXjww6p7lTUA78/Uomm5RQ6EfwCyr4i3mopBnsyEVp8yNG8PLietbyINLpYXil2ouHCZkTEHV86+TqBKz1YLbHDH05fbCi3JEw+iermj/SFYRHVfMmcY12hlc2eZJ/Kjd8F6OBQpQ+lFbXfDdZqZanCacteZoWSU0ARSGmEZwDJEVcHt1jm1JZCq8Hzv3XXVBfrGZbcu0Sw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17123e5-c454-4ed0-4dac-08d73fdeb212
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 04:30:00.1576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfKh1F0qYPAkuyYe55EpuIAeLy9N3Wc3vAYgd4JhB7zC8ePaiTCt7VvX4EpYfp9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKyYMkwFprTmqu85nrWgXliNOFWVg81wn6YnqNawcXM=;
 b=f5wmXSR/hyIs4cQ7foFmPf7yEXau186qctkswfxlp4V/B8n1ePxQXOk9BJvbszBeMHzlBMwpipGVaUDNExdIbT7TluwXrWJT+ch88RE/Zze/bO0vfkArI1JJk5j2gFnahWU2jHOpWcy3v2+w4TJEmR0Flom70jYbwTQFE1amN3Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHBhY2tldCBtYW5hZ2VyIGlzIG5vdCBuZWVkZWQgZm9yIG5vbiBIV1MgbW9kZSBleGNlcHQg
SGF3YWlpLCBzbyBvbmx5CmluaXRpYWxpemUgaXQgZm9yIEhhd2FpaSB1bmRlciBub24gSFdTIG1v
ZGUuIFRoaXMgd2lsbCBzaW1wbGlmeSBkZWJ1Z2dpbmcKdW5kZXIgbm9uIEhXUyBtb2RlIGZvciBh
bGwgbmV3IGFzaWNzLCBiZWNhdXNlIGl0IGVsaW1pbmF0ZXMgb25lIHZhcmlhYmxlCm91dCBvZiB0
aGUgZXF1YXRpb24gaW4gbm9uIEhXUyBtb2RlCgpDaGFuZ2UtSWQ6IEllMmI2MWI1NDYyOTlhNTAz
NjZiOWFiOTc5MDBmNGJiMTNkZTMzZDViClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5a
aGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKaW5kZXggYzQ3Yjg4OTg3Yzg3Li5jODI2
NjM0OTM4ZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jCkBAIC05MDIsMTIgKzkwMiwxOCBAQCBzdGF0aWMgdm9pZCB1
bmluaXRpYWxpemUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pCiBzdGF0aWMgaW50
IHN0YXJ0X25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pCiB7CiAJaW5p
dF9pbnRlcnJ1cHRzKGRxbSk7Ci0JcmV0dXJuIHBtX2luaXQoJmRxbS0+cGFja2V0cywgZHFtKTsK
KwkKKwlpZiAoZHFtLT5kZXYtPmRldmljZV9pbmZvLT5hc2ljX2ZhbWlseSA9PSBDSElQX0hBV0FJ
SSkKKwkJcmV0dXJuIHBtX2luaXQoJmRxbS0+cGFja2V0cywgZHFtKTsKKwkKKwlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIGludCBzdG9wX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
ICpkcW0pCiB7Ci0JcG1fdW5pbml0KCZkcW0tPnBhY2tldHMpOworCWlmIChkcW0tPmRldi0+ZGV2
aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBfSEFXQUlJKQorCQlwbV91bmluaXQoJmRxbS0+
cGFja2V0cyk7CisJCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
