Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5FD8345
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB26B6E89D;
	Tue, 15 Oct 2019 22:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD76E89C
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hybuu3dONXSBt4rS7BLBapeV762E8IGduwrbt2PUP7JVICMuqvcLP2TMSlHttBePg2uC0GT9Ie2/FYY0BFgt/hNu4DkMyosbBiyRBniiurYRQ98Tuu37/mMYFbShojVrds69uQwMGtYTJeE2Z3HrIZw4kv206/WH/jEoGDOA0g8gEIqxEE+cWl1GRW47LbRprUrk/6Ul1gE2U7jdhb7zpYEW/7j8JZU+OPmy/Y73vx8DxT9IEie6aFQPNJJW/6HNpkfHrtJR/k0sxHgFicy/RonVLaL4Wyz7SnPHvQHKDKxOAk2NeEPdDzZVGE8v1FIz9GjLULUp5I2B4vfocwwfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGXqpkVkWQNVOQSalhm84HXaVqcopXWvjvVmkVz6cME=;
 b=dAJ/iT1FPiTa0REILjR+c++4kspmoxYMRZ+UU6S9MvR0K1vi9VE5gcMWH1IBnU1kCDQqCroWoQe7I4DoG4lmTI5ht+Ik/+0gcKtnLjEUlKeKLQqkexvNfaNLaEPQC4Mz0funOq0i/IhNOPYi3yfSG5E3vp6OnrSeY4BbHY37zUIu/FqbECX3F9J0rBJGY5Ca94v4+58kda+eWzXDfgjfuylGBeO8qHafZMS/gkcQBAjcp7ZFsS/pYdgA7QuWcfOkkAnHkqQ1QjWd5vzETzWD8qTxvv/hnyNeGnZ8K8DQb+sdxZttygnlK4SqOJZemeGWuR9a3NlTVMCk2OCZDu4afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1800.namprd12.prod.outlook.com (10.175.63.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 22:08:09 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 22:08:09 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu/uvd:Allocate enc session bo for uvd7.0 ring IB
 test
Thread-Topic: [PATCH 3/3] drm/amdgpu/uvd:Allocate enc session bo for uvd7.0
 ring IB test
Thread-Index: AQHVg6UHSjMDRKTbqEOT9naSRYa/9g==
Date: Tue, 15 Oct 2019 22:08:08 +0000
Message-ID: <1571177279-9435-4-git-send-email-James.Zhu@amd.com>
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea286ec4-5273-4839-a635-08d751bc2957
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB18009BBB33B93A65681C8188E4930@CY4PR12MB1800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:551;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(8936002)(36756003)(5640700003)(446003)(81166006)(6512007)(81156014)(11346002)(4326008)(2501003)(71200400001)(71190400001)(99286004)(66066001)(2616005)(486006)(14454004)(256004)(86362001)(8676002)(50226002)(476003)(316002)(25786009)(186003)(478600001)(2351001)(2906002)(6436002)(26005)(6916009)(102836004)(6116002)(6506007)(386003)(5660300002)(64756008)(66946007)(66476007)(305945005)(52116002)(3846002)(76176011)(66446008)(6486002)(7736002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1800;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TE7skzN/4B6gUfifpSCCvdnkYtETTnNqc1Y+jsrke72J5nV8r0aU+AspHUphnv8lXpk9FYYFIcGZcpQjFGC1HU/SCPTKmfcCJwGe74a2gm5b51mnzrWVvQq+HnZ0NBqVH35pWXDT2FhkSVNsbk3uKsBLoyPYadxYZlYdOQLDoVdd4p8TTjtlBiYr+xlnoOaMC0AmXdUQo4SQwJBViyOMmIhL/U1H2BaYVHUDJ3DrJxH2Z7zP5AIIAzeMNtnTOnSgxDNB0qQmt5QoKhnsBu4w6cg88KK5+xvgx/Mc7JVGJArKnujlnsHN42Uo0RIk4Wjm4Yv+8oxN/j8t1P0vuUqe16Fr8SjA0p3VQrPpjhijZw4flb7sjRdG5c1O+DMT+6vgpeZE0RAHVV+mbU/qHiSsbPr9AD6JqbneXbwDnoMs5/8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea286ec4-5273-4839-a635-08d751bc2957
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 22:08:09.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4cdoVt0janr17V3iucFSeOxUfwwNtcH20JNAFY/07W8YgmHxPFicgqYGqbDmN3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGXqpkVkWQNVOQSalhm84HXaVqcopXWvjvVmkVz6cME=;
 b=tN86lw7tPg5zLNuMyD0j2lD9G6+MeNaqaMXqUVV8KhJcNw3V8398dqkVANt4k+qe19oFTcBDxRz3B8Gpo++x+V0kxVFG6ydCt39OwxkhRlOvsCLpr3rF9zrN1HZLAB5aOl1X1+bhI4+XbPi1njOHdIjWi97jaedR4ZFAXkVDlnw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxsb2NhdGUgMjU2SyBlbmMgc2Vzc2lvbiBibyBmb3IgdXZkNi4wIHJpbmcgSUIgdGVzdCB0byBm
aXggUzMgcmVzdW1lCmNvcnJ1cHRpb24gaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUg
PEphbWVzLlpodUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92
N18wLmMgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91dmRfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwpp
bmRleCAwMWY2NThmLi4xYjE3ZmM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91dmRfdjdfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18w
LmMKQEAgLTIyOCw3ICsyMjgsNyBAQCBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19nZXRfY3JlYXRl
X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZQogCQlyZXR1cm4g
cjsKIAogCWliID0gJmpvYi0+aWJzWzBdOwotCWR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsK
KwlkdW1teSA9IHJpbmctPmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ncHVfYWRkcjsKIAogCWliLT5s
ZW5ndGhfZHcgPSAwOwogCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7CkBA
IC0yODksNyArMjg5LDcgQEAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNn
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGwKIAkJcmV0dXJuIHI7CiAK
IAlpYiA9ICZqb2ItPmlic1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVt
bXkgPSByaW5nLT5hZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIgKyAxMjggKiBQQUdFX1NJ
WkU7CiAKIAlpYi0+bGVuZ3RoX2R3ID0gMDsKIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAw
eDAwMDAwMDE4OwpAQCAtMzMzLDkgKzMzMywxNiBAQCBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19n
ZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbAog
ICovCiBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nLCBsb25nIHRpbWVvdXQpCiB7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSByaW5nLT5hZGV2OwogCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKIAlsb25nIHI7
CiAKKwlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgMiAqIDEyOCwgUEFHRV9TSVpF
LAorCQkJQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwgJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ibywK
KwkJCSZhZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIsICZhZGV2LT52Y24uZW5jX3Nlc3Np
b25fY3B1X2FkZHIpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKwogCXIgPSB1dmRfdjdfMF9lbmNf
Z2V0X2NyZWF0ZV9tc2cocmluZywgMSwgTlVMTCk7CiAJaWYgKHIpCiAJCWdvdG8gZXJyb3I7CkBA
IC0zNTIsNiArMzU5LDExIEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3JpbmdfdGVzdF9pYihz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKIAogZXJyb3I6CiAJZG1hX2Zl
bmNlX3B1dChmZW5jZSk7CisKKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPnZjbi5lbmNf
c2Vzc2lvbl9ibywKKwkJCQkgICZhZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIsCisJCQkJ
ICAodm9pZCAqKikmYWRldi0+dmNuLmVuY19zZXNzaW9uX2NwdV9hZGRyKTsKKwogCXJldHVybiBy
OwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
