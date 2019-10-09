Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE1D0D64
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E770A6E2EF;
	Wed,  9 Oct 2019 11:08:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118A6E2EF
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvfFQhgCUTzTTx0gfggkkmdnQCoo4bWW7Md7iG1SeP9gDLMw2ls2iIPaAoJZIqOhxZVVjoNYdOOzRAr2WZrV2SdShKBU91Iv/EUpQxLwDL6mbkYdRqEboG3ZDn+Ot+vbg/l7UzS7211JMFeylivCTPPzOQbRcZ3MdL7oLA0NKZgcOApVDJbqe3w/ey24fm19HFLln54M4nmZnasNP6jc4uzJPWFGn3hT0M+jNdaOscVrN4DD6YaEvSKa6SxeISrYuWuyDA63BxO+TTowwaMR1RO6pToGhQ1FAr6Mxs1QGrVFJQ79NEKrohFOt4V5qgHEFIKZOzu6MtRWBJdkJxdlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iNRSkbr6SDM6dkQylGzdMJ3TbAGw05wqoj0S08/RwM=;
 b=U6Ga1pBzyhJko/1q4DcWft+q3ib+KbhV8srxanDPHHTGXQ1rU0MEhJkduLVWGHNNkuS6T4fk6/Y5EMl8f27jEEkw0JnFaCpXd6uGUxdYB0Be2vAWclvv7G/V0yiu1oyEsbd7KwMiZFOrT7Fii0E4Kg5+al09fBYg6MnIoTpLic9Lo4au2Y1YSy9kdGoHp0GAKh0Uvcau/6m9+yVV+6qZnG2UlIz5hrAwr62Bx4/Fnc4Soi0eR268LA341xSUvQiAlSTd6Kbg4fsqUpeeOBjRE9V1zqsGvuHVQIgOi0sjz2NdeYZU/gexOEx3nff8U19wA8gEjZljZeFJ64OUfLCDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3092.namprd12.prod.outlook.com (20.178.212.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:08:23 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 11:08:23 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHdm9nABvnAkEes+Y6Iseje4g==
Date: Wed, 9 Oct 2019 11:08:23 +0000
Message-ID: <20191009110757.30995-2-xiaojie.yuan@amd.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191009110757.30995-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:202:2e::30) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7896e141-c6da-49ff-f6e8-08d74ca90013
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB309284C20FB46B55D3DF96C689950@BN8PR12MB3092.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(99286004)(186003)(3846002)(305945005)(6512007)(5640700003)(478600001)(2906002)(86362001)(4326008)(2501003)(6436002)(2351001)(36756003)(6116002)(7736002)(6916009)(6486002)(14454004)(52116002)(102836004)(6506007)(386003)(76176011)(5660300002)(256004)(71200400001)(25786009)(50226002)(71190400001)(66476007)(66066001)(66946007)(26005)(66446008)(64756008)(11346002)(446003)(476003)(2616005)(1076003)(54906003)(486006)(316002)(8936002)(66556008)(81156014)(81166006)(8676002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3092;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZCDXSKmOG60HTQiKM+VxeA4qm8KHT3ToyW6yfN/cH1SJonCfMbb3/BZ67R+M8LfeFJDX5Zs/3LOVLMfpmLCJGyCQWkWkmJnQ0mMhw0XgFHMD96MKxKO9u/thf1hRtfTwdAPXgvN4BhGVvH4HQA7C2croibSiEvvTRI+oxy9h1P7EJQtmVcrbHw2Bd9x+9GafNSK9vTS8vx94A6eqn7E66k9IRT9lmXmq8zJhe/C9FiZxcitCKdfkmjUhGXsBJuvcodLBd3/DAlKFP2vHYkgfsXgmA+k2F07MJjWfLw0R93wNf/kTM/9U5z/C5ZSBPMBb4zqEwCAPwwy3JcdKeYTnCI2isI1LyAbNRWSNTYpKezVYaZYzWO1KA4CdCIyYD003lMiC2YTcS9mpimXqCyRqK50yg8+9EyQV7UujWMzU/c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7896e141-c6da-49ff-f6e8-08d74ca90013
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:08:23.4284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CaH1aiLpV/0lfas5Z6bGqtHMN6GShMhBsA1QOBhd7MisflyVAlYsDLJbRV7Nt8aX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iNRSkbr6SDM6dkQylGzdMJ3TbAGw05wqoj0S08/RwM=;
 b=sZCBF1GGJzp4ncpkSZ/UP2FzXNAEczX85t5wHwrQ0WG2SI/pQJY522t+NRM0mdqAu6tXTiaFvs5P5PP3IMIiCJhiu13BXHQJwx77OaXtxlQ+6IiIQHA8HON5sZUOLLtM1e37I4OuoibJPBAneyM6SdyOxbR4wtJuRn3JWkzwyVY=
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

U01VIGZpcm13YXJlIGhhcyBmaXggdGhlIGJ1Zywgc28gcmVtb3ZlIHRoaXMgd29ya2Fyb3VuZC4K
ClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNSArLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCA0NDE1MmMxZjAxYzcuLjM2Mjgy
OTU0NjljNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpA
QCAtMzU5LDExICszNTksOCBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfTUVNX1ZERENJ
X1NDQUxJTkdfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfTUVNX01WRERfU0NBTElO
R19CSVQpOwogCi0JaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykgewor
CWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZGX01BU0spCiAJCSoodWludDY0X3Qg
KilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYT0ZGX0JJVCk7Ci0JCS8q
IFRPRE86IHJlbW92ZSBpdCBvbmNlIGZ3IGZpeCB0aGUgYnVnICovCi0JCSoodWludDY0X3QgKilm
ZWF0dXJlX21hc2sgJj0gfkZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpOwotCX0K
IAogCWlmIChzbXUtPmFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfTU1IVUIpCiAJCSoo
dWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1IVUJfUEdf
QklUKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
