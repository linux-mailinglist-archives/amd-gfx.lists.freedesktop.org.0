Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87CA862B
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3106E89BFB;
	Wed,  4 Sep 2019 15:48:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD02289BF8
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1kSvl6fIRGYpgXCRxaIOKeyouBXV98/bdH/9pFFv2GZ6dBLd/nS7AnnoGjNu8ixX0rNNoW9Vhq5DQZjV3lIHJyp5HT9aowHkABtvjnposd+vjDfrI8+gbJGa0/Q/us4hIan5RKgDESAY5bDmyf5r6c/EW6KENHDuGQ+ZRFifaTLuQp+DMI2w82H9G5MHKF8MoO2L6R8cTwkq6UF3v0Or79uFVqzHIIeBMFxt+D2OZuNPk0wVIHtQnKfVvFwFvKH4n5TyJ9THdvX9ovc7zfec12FWnfYF2M1ll6cgM3CK6TNLsAnuAb5smD/Pq51pOwMsLWnW+RmWVXsPf+0fNXaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAakb6sA0mnaAnfw4Zd/i8TqS61i/k+RvfMF24N0RwU=;
 b=OjkwQvduvXgdWAE7y1xvpBpVkgRNMq9/yc2Ic+uU0YjsQOv43zFpRWvJKvRC/7YGrjOXKGZXycRS7bWMXGmjcsrWb6ozY+aEXhTL5ScREe09IZpKGcWgCZMpgkWy02m73uKe/7xG1LSDvfBBzKsA8PSu56eGveyw2R6NyPU3lep/sd2KyYVJrwTnT1XcSEGf6hTqZVB144g+5o/Rsxh8zUPjBTq4qzOYaqmNC8Hsn4bOKczVKiFcuykHVST7ZCd/JEajBAmxCqexGBfMcUudYZgFzRkYdi58loJMy+srKiZRSdDYDq+MaQblO9iC/p54rZZCeD1hn8RG1VvR/JZNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:30 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:30 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/amdkfd: init kernel queue for renoir
Thread-Topic: [PATCH 06/10] drm/amdkfd: init kernel queue for renoir
Thread-Index: AQHVYzgyKi66OMYBjUC+J6om4ThLuQ==
Date: Wed, 4 Sep 2019 15:48:29 +0000
Message-ID: <20190904154803.5102-7-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 699cf24c-4f73-45b8-4a4a-08d7314f5522
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28639279A61959F6221F3855ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t5Y+81RuRUn+iIuVq35OCmpZIQCy8Nrnpx94hPsNKvFe1agO3HtaDw4lIlAwBiawOMM5jIySSIsHNsKffm8i9p8v6msFzFYbmb09rVUUA3E3FiMCbHPbZphZCJYUwf+W0GfltfPr3JsoV+Nz80h0bRJ+G8+7zNIw8ggqe0yHw0wgAWqRGaHS0yhhZo+GeCI79Z/njHjf+2o3dskB4HR667kCw8JJO3xDs5DJV8WVQChgzm3dVvICV6B3EyrNZvYv6Suj3Qg4PrpVgbeHZEp2FeG8SLiaHvPapYYqGcFOQVlacqQvQxWV/dyAuyOPHc0au+SeH5ksplgUMrVqX5chTgLH66IT2bJKqOn4hFf28yzvaZfmwug8LB5/00aOikdG+fEQosfYwmoEBb1vjo3wHli4kuFU9JGr3yt3iUZp29Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699cf24c-4f73-45b8-4a4a-08d7314f5522
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:29.9460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKZt6idlycECX6zb9erPo17YLFbFU5riqyZDaT12UMLvDAJ4kdtoDt7QwGdSJbu1QJ5hGJcuQq+qpBN7kfSW7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAakb6sA0mnaAnfw4Zd/i8TqS61i/k+RvfMF24N0RwU=;
 b=hramSkotKOOAKa7fJNcAhBSX2B4OrpICmhDC8XV75SiAgdfbjp8LEd509XeX0wBFKmtvCqP83FcnI8MHjVUsGLG3QVfNf2pg/+UDax7pyOVlrQBvxT5R6rfTK4tgBnQ3g5hZYgd7DfJMC3wL83xI2Si8qc1668tlRh9vSQwDik0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVub2lyIGlzIEdGWCB2OSwgc28gaW5pdCB2OSBrZXJuZWwgcXVldWUuCgpTaWduZWQtb2ZmLWJ5
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9rZXJuZWxfcXVldWUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5l
bF9xdWV1ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZS5j
CmluZGV4IDI2YzY2YmIuLjI0NjJkMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9rZXJuZWxfcXVldWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfa2VybmVsX3F1ZXVlLmMKQEAgLTM2NCw2ICszNjQsNyBAQCBzdHJ1Y3Qga2VybmVsX3F1
ZXVlICprZXJuZWxfcXVldWVfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqZGV2LAogCWNhc2UgQ0hJUF9W
RUdBMTI6CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQ
X1JFTk9JUjoKIAkJa2VybmVsX3F1ZXVlX2luaXRfdjkoJmtxLT5vcHNfYXNpY19zcGVjaWZpYyk7
CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
