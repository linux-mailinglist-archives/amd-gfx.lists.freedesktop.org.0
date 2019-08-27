Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50C9DE94
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 09:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3449895EE;
	Tue, 27 Aug 2019 07:20:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A6089565
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 07:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxEQEkI3CXhQH+XZwIuYoiR2cylDl61rAXARzHTCeaRN78pyyPo4ujZkNCome0XxQ04ZPxCobY4P5k/9IEQPdyoc2ylatqzynGpStrjlUgjvduHeAauEX/dxGrcCadixq37xizqV0OCwz/5m22ry5Fhn75pvdxuDycE5cLXe5xTxqA6ruxEHQ/U3xZhsYNGGhctKbn/ssO/0V93WiXEXF26Sr4w5Q9DAnztKl16D6zs4RnE+W3WU/7XHy5WwzGI7IhFY3ECjz28powjjDeRC4yM4w8mjkSYZdzjv8GRTXvNYuTVZQM1cWVJUFnAi8/9/kHmb4214BeNda0+i+NxFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcohLdSEaf9k7IY0UnloVL4ICtkGyBloiky5v5vum/I=;
 b=PLgjPWe2rF5bV/bQXhmGXz7jqC8kiucwXNPW/83PmS8Nm2niKJ4xMFNlqNY35tm29SVKIJBDFm/0n1enSytfUcUal6yQ+pv4XO6D8NvGc7BejQ9JUcQx93e8znIIAIYRB1HuqBP5O+Y8YK1swPouFRgHY7timMENceuVgyWu7Q7yTm0mVw3xYQoNnvDKzIWC4E/gc28vZKCdW7jfOe+UXf4yRcUrkhrQuWgXs+06c2xpN3Al9KVtSnWeNZZ7ppE3BxK/QRhKb8weKWkMK7hYUQzsJZIFK5CStIAehCkAL79NqZiqdDrXtlOfu5u5b9RQhWsIAOUlNERUQjfObPW5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3380.namprd12.prod.outlook.com (20.178.210.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 07:19:58 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12%6]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 07:19:58 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: enable vcn powergating for navi12
Thread-Topic: [PATCH 1/3] drm/amdgpu: enable vcn powergating for navi12
Thread-Index: AQHVXKfVuWRQpq46f0y+Pa2YCylVqg==
Date: Tue, 27 Aug 2019 07:19:58 +0000
Message-ID: <20190827071941.23862-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c4265f-2a37-4f44-f1de-08d72abef783
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3380; 
x-ms-traffictypediagnostic: BN8PR12MB3380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3380BD38AA1481EEDFE5AF5D89A00@BN8PR12MB3380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(14454004)(316002)(478600001)(6512007)(2906002)(54906003)(71190400001)(5640700003)(2501003)(50226002)(476003)(71200400001)(2351001)(2616005)(81166006)(102836004)(14444005)(7736002)(3846002)(6116002)(6916009)(4744005)(36756003)(99286004)(386003)(6506007)(305945005)(81156014)(186003)(256004)(26005)(53936002)(66446008)(66556008)(4326008)(1076003)(8936002)(66946007)(5660300002)(52116002)(66476007)(64756008)(8676002)(6436002)(486006)(86362001)(66066001)(6486002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3380;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +xZcswBEsH72hOUJbdguDuLVnPpsCwhSHFBU9J8474No4E9iBz4j9t8IbnbMAnVk2883inSu8fjoAhLsjiezcAY6jg2yUmZDmUAj26bg1Iw/Lryyj6CJvJhdRmJVgASRkXjnqTvU/yljQgGqEISEDv4V5S3Y98fj7H6RDzJERCdnsQ6Teni2jmGX265FwqQb+haarlaMGslMbZN5FN/1tgErRxtkEgvoFze63/QoOZcLDO/BxYbTFxf77qJXtbnm0fjO9jpA7R4+GGJEP0TkttoCIUteUhojKaQKP2JtivEMEALJAhX3vHO7I651fY8sj3lyGY4ZaWeF9yyRec2OF3bM2LoP70RLXly8vaQphV0nS5D64FKGTuxdLvDOk1ms5s4IDuRLlHYRLjgK6L1o2ITdQDOFlUfy2ITnowkEypM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c4265f-2a37-4f44-f1de-08d72abef783
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:19:58.6423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fa/UOjqHDJndQPR3j1q8WySHZZJqOYf7ECvQPsmKp8iRQJxr/o+ZyLpbrAEbpUoY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcohLdSEaf9k7IY0UnloVL4ICtkGyBloiky5v5vum/I=;
 b=3aaOyU1FjbrJYDhy8BXNmupanFYBP28xCy0Zfk2zKyTuJRf0q618WbB8Pu6ho0QeK2Qo1YTBlzRa+9FT/V5U7dX7LMTubHXWxu9Ct843lehv7v5AhQBDKJTOyuk/HP/er+lwXYL6+sOyG1QSJrglaXZgOMmGXyvS0wsSAVDxWjI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRl
eCBhM2Q5OWYyZGRmNmIuLjllZGE4MmQ0NDMwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBA
IC02NDksNyArNjQ5LDggQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpo
YW5kbGUpCiAJCQlBTURfQ0dfU1VQUE9SVF9BVEhVQl9NR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JU
X0FUSFVCX0xTIHwKIAkJCUFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHOwotCQlhZGV2LT5wZ19mbGFn
cyA9IEFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7CisJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NV
UFBPUlRfVkNOIHwKKwkJCUFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7CiAJCWFkZXYtPmV4dGVybmFs
X3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4YTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
