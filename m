Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F60BFA46
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 21:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977336EDFF;
	Thu, 26 Sep 2019 19:46:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2136EDFF
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 19:46:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgYJAgWmToj17PlXwzdpAVjcRs6US9Q9pucL933yNate6f9H9ioXoniKFfy6BiJLM9lWhBWjzVAyITITTHn1Ux9MYyJmJzp/Vnk/cQp7y4dMQJKzZkO4JUpUe0VT+/fqfT285/wg7n+NWLUw/c7oF8SALdfK3gtvEr5N55d1hRzhxR1RXqx24eba94RWIbtxQFNQpXyTzFhw2zKGlpqRPsvYN1J3zyGXAFHNkc1q96CR3QBrn7lxxQrN6t6DPD5EyLzeCD4f/AyRHQaZbSStfnbi/NmgTpsqwIrr55AWPFZGQvdsPp8eB5mXEOXzQq9BHCCcIatgEM5BEiH5DNgnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0nnlIm7PSrF2EspRGzBAkErLkC2Iym/R+E2oHsDVQI=;
 b=ZptdwwFtIlI0NM+rc4pbubKZYN/fwxGR8a3dHdXf2IwAzYC5S0hN9b8oRguQ+lrUcfjJ2IW3UJyPV1Fhn7baus+iPcZPM+9YfFjoTs6tTZWLm769Nb1+9PepQXieLqKfY8gHQQ4b4b99s+DD8fEgCEu3j5l6WKIDfXpXrIlR+0Kn3VEnHwjgccuBoMiTmuZWqUETOABJrqZpuaTvbGSfhx0OY9HopCY5r7WVFAwd4p41qgUC/eXekxbPYFzdToMdmO99xDgIJCdnGukYT4vHj8IHELZjumO1gBCq2Jn5h0LRpZkRpO6ZeP+dLUEcF4MvPNputtXyk4zSt63ppWdP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2809.namprd12.prod.outlook.com (20.176.117.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Thu, 26 Sep 2019 19:46:05 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 19:46:04 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored info
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Index: AQHVdKMIKRobzCt25ka1WEgudtQP4A==
Date: Thu, 26 Sep 2019 19:46:04 +0000
Message-ID: <20190926194548.15119-2-Yong.Zhao@amd.com>
References: <20190926194548.15119-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926194548.15119-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58668839-d1cf-4ff5-8de7-08d742ba2aca
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2809C7EBC2195678389551DBF0860@DM6PR12MB2809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(199004)(189003)(305945005)(2906002)(478600001)(2616005)(25786009)(2351001)(5660300002)(476003)(66066001)(486006)(14454004)(6506007)(50226002)(386003)(71190400001)(2501003)(36756003)(102836004)(186003)(26005)(81166006)(81156014)(52116002)(76176011)(446003)(99286004)(8936002)(256004)(11346002)(1076003)(8676002)(71200400001)(5640700003)(6436002)(7736002)(4326008)(6486002)(316002)(3846002)(66946007)(64756008)(66476007)(6116002)(86362001)(66556008)(66446008)(6916009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2809;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJi1AbobndG69FjIh8q5j5D5PjNlqesGETmfKSoEfQeq/xwo+IwLzGZO8UeFvmsoR6/LHjG+HIhWDm9/v7GwX2+Azm9TkZVVpo+R1ATYDaMxXIsHVhxQjSO84sYNku+BQlZeBLuEjW/22qpQLabQ0KZwEu0b0YUHGDrTBIVLxjtbldKfq3uktxoQzWjOXbP9dMSsYqRzTp857zP1G2Q3BOOLYzjWvGI7p3ytKHFbWbrFKFu7SDK87jAZYWKuzoTzzmsy+7Hy7Ok0inE++Gi3gCIvKBvuIgBhlT0q1pFfiNUSGqpJXJ0gpYnf7CPnBzIWsbqLG2FGpdgcVZ7/gHhGaIPOX1r0CoLPSMvJgXTAaLAzlGfzXnSEXPCQFnqnISZ64oMO1R/yQ+XwiioLKmAh9m0dbJbVTLHyqpPvmA4U0ew=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58668839-d1cf-4ff5-8de7-08d742ba2aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 19:46:04.8420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgLjCCTiGVhl+/CvxojySCGswm70OjdeTT81Ci3MW9uesvdgUxjLqaMtlde04Dkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0nnlIm7PSrF2EspRGzBAkErLkC2Iym/R+E2oHsDVQI=;
 b=H/thTnSwp7T20kInamLOVXnBrhQqob+a+OQxSp3iOkmJYb29OqH6MLzztXd2lseie29fIncu0/P8K+XgtN47lASNLn5bpTJiyCpwcebKU4KPYfooW/NoocwPStTH/R6jDwl9qCJogiz0hGuKwpmjORSsiRsC55L+000/99ULrvE=
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

QmVjYXVzZSB3ZSByZWNvcmQgdGhlIG1hcHBpbmcgaW4gdGhlIHNvZnR3YXJlLCB3ZSBjYW4gcXVl
cnkgcGFzaWQKdGhyb3VnaCB2bWlkIHVzaW5nIHRoZSBzdG9yZWQgbWFwcGluZyBpbnN0ZWFkIG9m
IHJlYWRpbmcgZnJvbSBBVEMKcmVnaXN0ZXJzLgoKVGhpcyBhbHNvIHByZXBhcmVzIGZvciB0aGUg
ZGVmZWF0dXJlZCBBVEMgYmxvY2sgaW4gZnV0dXJlIEFTSUNzLgoKQ2hhbmdlLUlkOiBJNzgxY2I5
ZDMwZGMwY2M5MzM3OTkwOGZmMWNmOGRhNzk4YmIyNmYxMwpTaWduZWQtb2ZmLWJ5OiBZb25nIFpo
YW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9pbnRfcHJvY2Vzc192OS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9pbnRfcHJvY2Vzc192OS5jCmluZGV4IGFiOGE2OTVjNGEzYy4uNzU0YzA1MmI3ZDcyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYwpAQCAt
NTgsOCArNTgsOSBAQCBzdGF0aWMgYm9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBr
ZmRfZGV2ICpkZXYsCiAJCW1lbWNweShwYXRjaGVkX2locmUsIGloX3JpbmdfZW50cnksCiAJCQkJ
ZGV2LT5kZXZpY2VfaW5mby0+aWhfcmluZ19lbnRyeV9zaXplKTsKIAotCQlwYXNpZCA9IGRldi0+
a2ZkMmtnZC0+Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQoCi0JCQkJZGV2LT5rZ2Qs
IHZtaWQpOworCQlwYXNpZCA9IGRldi0+ZHFtLT52bWlkX3Bhc2lkW3ZtaWRdOworCQlpZiAoIXBh
c2lkKQorCQkJcHJfZXJyKCJwYXNpZCBpcyBub3QgcXVlcmllZCBjb3JyZWN0bHlcbiIpOwogCiAJ
CS8qIFBhdGNoIHRoZSBwYXNpZCBmaWVsZCAqLwogCQlwYXRjaGVkX2locmVbM10gPSBjcHVfdG9f
bGUzMigobGUzMl90b19jcHUocGF0Y2hlZF9paHJlWzNdKQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
