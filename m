Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECE63FBB
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C998189A08;
	Wed, 10 Jul 2019 03:59:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168CD899B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:59:14 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 03:59:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:59:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdgpu: Mark KFD VRAM allocations for wipe on release
Thread-Topic: [PATCH 2/5] drm/amdgpu: Mark KFD VRAM allocations for wipe on
 release
Thread-Index: AQHVNtPT+jm88erlkUidkV9eo/zyRQ==
Date: Wed, 10 Jul 2019 03:59:08 +0000
Message-ID: <20190710035848.26966-2-Felix.Kuehling@amd.com>
References: <20190710035848.26966-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190710035848.26966-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87b18ad8-07b6-459b-4785-08d704eaf5a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3001; 
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-microsoft-antispam-prvs: <DM6PR12MB3001C012652439754A1E54C292F00@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(86362001)(76176011)(52116002)(68736007)(36756003)(2501003)(53936002)(71190400001)(71200400001)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(6512007)(2351001)(3846002)(6116002)(316002)(99286004)(478600001)(2906002)(6486002)(50226002)(14454004)(25786009)(1076003)(5660300002)(26005)(11346002)(476003)(186003)(486006)(446003)(2616005)(5640700003)(305945005)(7736002)(6436002)(102836004)(6506007)(81156014)(8936002)(81166006)(386003)(8676002)(256004)(66066001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HInsSj02l4xsndqs1sDtv0L8rTVPuqurjswJugm8Se44UJJMKtaYbUYRWtlRHCSAFuz633TSnRQyL66Mq/OKNxXzZHNqHBeGzL4VkgGFyGcDpkcpMXKjfmkd9dob9HTbsGWRQH9I6tS9J8G5rlEuWRagXEK96G5dDGAKUHsk5jhRftcwnlzJ1f1cBMBjE6cqWEDKvV9HHhXLj3J8G841gwx/gyB9BFy2o1H8KxIvGnd5m+ya/DJklXCAQqfROqHC3tLsMwP5VonmNKIJdNfATM66s3/DWxMFYp+z7deZ5aCMXg+86d4E8RYPtS2Q7UMIHdqApyZHNqb00/gfxXqOE/rhUa20ycHEccTM+SA0H/NWCFOeLC/zwctqgZh0CEnwsyFRymwbyXOo3wMWERg3bNiEQyOl8wHl5uWQtUoqW00=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b18ad8-07b6-459b-4785-08d704eaf5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:59:08.9048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYz163Iy4mzaY2gFboYtP1ZoRqm4ctg7xFA9N5x/UPo=;
 b=C7zpYtiIX4djU5M/QEaK3JzKDnkvbmiFlkDZMk8pQsPkon3hJhZH9h0U708gBV22HeAl1Y2MiiFDadxV/ptcRUI4HZ5OyUYj6DR7R2YRrPMDJuz/YpeuPRSF5hmsOgzg3lUaPslxtXr1/Nq3R2Ny+6n7kpWagqPeDr6zGex0pg4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWVtb3J5IHVzZWQgYnkgS0ZEIGFwcGxpY2F0aW9ucyBjYW4gY29udGFpbiBzZW5zaXRpdmUgaW5m
b3JtYXRpb24gdGhhdApzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9jZXNzZXMuIFRo
ZSBjdXJyZW50IGFwcHJvYWNoIHRvIHByZXZlbnQKbGVha3MgaXMgdG8gY2xlYXIgVlJBTSBhdCBh
bGxvY2F0aW9uIHRpbWUuIFRoaXMgaXMgbm90IGVmZmVjdGl2ZSBiZWNhdXNlCm1lbW9yeSBjYW4g
YmUgcmV1c2VkIGluIG90aGVyIHdheXMgd2l0aG91dCBiZWluZyBjbGVhcmVkLiBTeW5jaHJvbm91
c2x5CmNsZWFyaW5nIG1lbW9yeSBvbiB0aGUgYWxsb2NhdGlvbiBwYXRoIGFsc28gY2FycmllcyBh
IHNpZ25pZmljYW50CnBlcmZvcm1hbmNlIHBlbmFsdHkuCgpTdG9wIGNsZWFyaW5nIG1lbW9yeSBh
dCBhbGxvY2F0aW9uIHRpbWUuIEluc3RlYWQgbWFyayB0aGUgbWVtb3J5IGZvcgp3aXBlIG9uIHJl
bGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMK
aW5kZXggZjVlY2YyOGViMzdjLi4yZGI2ZTQ5OGMwNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTEwODksNyArMTA4OSw3IEBA
IGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCiAJICovCiAJaWYg
KGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0pIHsKIAkJZG9tYWluID0gYWxsb2NfZG9tYWlu
ID0gQU1ER1BVX0dFTV9ET01BSU5fVlJBTTsKLQkJYWxsb2NfZmxhZ3MgPSBBTURHUFVfR0VNX0NS
RUFURV9WUkFNX0NMRUFSRUQ7CisJCWFsbG9jX2ZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfVlJB
TV9XSVBFX09OX1JFTEVBU0U7CiAJCWFsbG9jX2ZsYWdzIHw9IChmbGFncyAmIEFMTE9DX01FTV9G
TEFHU19QVUJMSUMpID8KIAkJCUFNREdQVV9HRU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQg
OgogCQkJQU1ER1BVX0dFTV9DUkVBVEVfTk9fQ1BVX0FDQ0VTUzsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
