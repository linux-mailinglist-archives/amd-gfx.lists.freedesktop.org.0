Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABDA862D
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDE089C07;
	Wed,  4 Sep 2019 15:48:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FAA89BFE
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ5zdCkatiBeKfgga/A73aHQNLN6QvJ1Ll7Sll1DCWDQyFb8RZR+oau0hGTuTyX0aOw86AG+uKiddI8j1bOtDWmaX+PLYWdFb36e+zfgLNvBJdIQcNPoPvptqaWiV64YrULKWU3+pDZEaG2oeBvERAJE7B/wK0IhVwgNMVPgLZlspwercjU1JVb8GSDKiB7EQ9Pl04yQpk6+p0AgsNSCiqe3p/blTLIztAd665Bxq/ywFDSY8HP3/Q6QkOVq1w2W3iT9Rvb+xSBUAVv/AbBkq7gyl+7sRmMic8JvXGD3xXj114adzzdM3v7wKXsNLBuTLrHWwQ5ppL2j5mT2wsAISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhsuXER5mqqaBm7zUsL7KpADP31c/Plek5IO1IEu8xY=;
 b=AtqagSAPDFuuXnwpWymUSPi2YnrAHNi1pYcPC9uaW1kb8+/kOSPh9F8xx85WaQKQVNdA2DExDDd1+5PrvDK+pkA20h3gI0kQOU8XddfuBpW0hR6V6sPhNihiQ3rlDU16QBV2qlL/f4bU8j0/Ty00giOWido7ZC9Ku6vE8e9Xz8zaK2WdnKovvvl+iya5B3dmidtIOXePn0ZZY/eHaTrvkmbTBS8KBg0PjLTAgrXEJLNk2rH+scZ/ORmzmHiAraAY7r+UKGKCf8iqe+tSm8bceuN3SVEz3U4rAdFrYo+6VFqB2/n8+a6pj9MS0WLLIIL0luCs5642jxejMwk/tuEgwA==
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
Subject: [PATCH 07/10] drm/amdkfd: add package manager for renoir
Thread-Topic: [PATCH 07/10] drm/amdkfd: add package manager for renoir
Thread-Index: AQHVYzgzn6CyTE7QiUGBiFzmZL54RQ==
Date: Wed, 4 Sep 2019 15:48:30 +0000
Message-ID: <20190904154803.5102-8-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 38208acf-2ead-4d6f-7f0a-08d7314f5596
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28639FD6426B7BFC5E36F8FDECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: WuWrs0eZTidxWK6OnE8WezpTV4D1nQUnEOA210z0e5Khiux2/0/Ehit9VYwhgGC7BVtuoxguwkM7gyRk57wo9j0Sgbq8FjdiAiS1MbEPGkfyqTrzPfu4yOse0ksy2j52EtRrUhUlRi9CoKgEKlk7MEeA96uVwoKRjVAwMobK2IAZRXf/NE38aq9z223KhlP+XAZuQdTQ15QAB8v4ypdW4J21Fhs0uEpT8jp9sLtUS1MIry6Lp62eyshw//AtJ7c023bEbImCQ6gN+TWTRdspeFuopfOUSkkBVM0jtbBnZHLP3g4QM7OfzCnKAlUMDn6wCxM0aZ+/+V4LZh8vKCB4TQEZEnY2M620mVlKD8WhGBK0g6chHuf3dHE27o+4bBOaAy88Ph58nUYoW96B0ui90cx9nzho/cb2S7Yp5EPDli4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38208acf-2ead-4d6f-7f0a-08d7314f5596
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:30.7256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70XCM8enNNLN+LUSocY+/hh4syG/JHrr5lMGQTsWV1UtYNj7zPC8yu+FsDo3zrGZaiQXhHFITkJB4ksS4icUhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhsuXER5mqqaBm7zUsL7KpADP31c/Plek5IO1IEu8xY=;
 b=Qg0GSohVKr08Kv1n4E63XhUa6a0SJ03ocdQhPj8I9mnVUJlzkexEOupyTgfvuZFJbSq9tokmJZ/B0UgdDedBg6sReHiQL/wWoVjgffXEyA8EL2OcAAFdOp6voMs74Ok4EFUee5z/RW2kCnzpdnTGKkSPiW2Ir68uoSStYcB+Qw0=
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

UmVub2lyIHVzZSBHRlggdjksIHNvIGFkZHMgdjkgcGFja2FnZSBtYW5hZ2VyLgoKU2lnbmVkLW9m
Zi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3BhY2tldF9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0
X21hbmFnZXIuYwppbmRleCAzZmYzNGU5Li44OTJiMjg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYwpAQCAtMjM1LDYgKzIzNSw3IEBAIGlu
dCBwbV9pbml0KHN0cnVjdCBwYWNrZXRfbWFuYWdlciAqcG0sIHN0cnVjdCBkZXZpY2VfcXVldWVf
bWFuYWdlciAqZHFtKQogCWNhc2UgQ0hJUF9WRUdBMTI6CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAlj
YXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJcG0tPnBtZiA9ICZrZmRfdjlf
cG1fZnVuY3M7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
