Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF5D8343
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925C56E89B;
	Tue, 15 Oct 2019 22:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373406E89B
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqhgKjmuvC8pSeDk+UJrWrwNfftVZv2D6VPdIUlrsVFc7Rqv9RW9BdArIeDvBOw0GcQBg0/B7fGSPDQcpBFpo/H5dedRMgDvIFqm8J/0+fHtrxiJQTjDt3FAPHw5Hw5K+9CyswkMpGHWVqjPtQlgp6jggqRgN93gX0VkgmMk2sNIC3yNQ9NyNmSxZZu9tvxceUKOIPWhMHPuMVCOJi77WWTjnNZwlUGQWeArQzHrqOK+99GXBOs9MZJcm0xnH2wZDlj6245ZthdzcUw263AFZzftha9sbUbaA62tYtU9WjIINAVmmdD4weuzoCgr+UMVeqIPVTOwS29RPfXWw34FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xzkMx9x6owP9UJbHCWMX3pYUd8ug03et3n0mIaxOdw=;
 b=ORbHU8vopv8He7Nh9tsjOZHemF6K7QXMZpyCjBkku5ika7RWQCdB1laqB1nEreAeWLp9wk1kXiGzwCio57+iFK8lKRWSi2cRhz1tuV8Q3K4ZX/W0VQgDChln5+Qu4XBJeKK/b1QgYDhpUdb0pk9eLJdsWsj7iQc+gCr4EkJ4sxWe0MY3kSb8xBHaQ/FSwDkgJVqC36v8IHukgTwJcPQVojvMPU6oEnmJsDcwATykqUnoJTikxQY/ur8TbKHPHGwC2jOH5nWU5Ae2pIjeNRBhftgmptKztDoQMidqJm8oLyqVuRA6Jn2957Z8l78LuJIMjI0KZiADbKdvof5nrsCmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1800.namprd12.prod.outlook.com (10.175.63.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 22:08:08 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 22:08:08 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu/uvd:Allocate enc session bo for uvd6.0 ring IB
 test
Thread-Topic: [PATCH 2/3] drm/amdgpu/uvd:Allocate enc session bo for uvd6.0
 ring IB test
Thread-Index: AQHVg6UG6dD3NmEFE0ezfxrm1hF5Cg==
Date: Tue, 15 Oct 2019 22:08:08 +0000
Message-ID: <1571177279-9435-3-git-send-email-James.Zhu@amd.com>
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
x-ms-office365-filtering-correlation-id: 80324ef3-9ae9-42dc-ba94-08d751bc2907
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1800BB224AC5DBD78833C9B4E4930@CY4PR12MB1800.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: V3DbXuFEq6TUiwePKinbuXUX2R+fgsbM9KtIza7ssq+D92ot5ESfxwJyLOvOY6cqE13TxcKEc29vvis/ki74ZwimZmpl3t/PCVbEZ6V+Q4ZNxq0PcFcp6Fh2iUTf41V/ROcWTxMEgVTQ3szhJSYRqF9mSqghqEwUdWwXynHC0kcqwNewtmIUvViSdcOR/XGl3YJ1xPhcmIaIXOqirPxkrMZgoC/9zaVSNgdYrj2JlqZqpVMSOwRv4Q+LPs5p1yTkjQGOQFIOy+m7B80bc6KkXqs8A/pbc5rvQJg+qKXESV96jLTsky+FqJdjwEMSTm+sLGGQC6A8kvz6KvyvHeT+H5RzCdmf8P8PKlpOmBJS7/JP+bnWD08UADH7u3aQ7aovQxZFwVJn+LRserIQy5x7xxLsSoNSFkj91VXm15x+29M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80324ef3-9ae9-42dc-ba94-08d751bc2907
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 22:08:08.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OrJV+4hbiBix0R43KQrkaapvIKodANvHCy1b3ldOS6TYxVtmp4h69vxWw9FnDPN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xzkMx9x6owP9UJbHCWMX3pYUd8ug03et3n0mIaxOdw=;
 b=gpEruK77BdNupOb4D8rK6K5wzg7Qr+WoQ33DovtVK0l+jXUSSMPip5gjAKFlnKuHag+BjiXEaHbJl+qoBKJ2r1KnsCwjlQawWR6IIFmBEUqd2xXVnyIz/Ka9EsY+R3fAI3BlLBOfVTZyODbs4ljXW3XfxfMiJsMSCK+1AuFsUCg=
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
Nl8wLmMgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91dmRfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYwpp
bmRleCA2NzA3ODRhLi5jNzljZTczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91dmRfdjZfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8w
LmMKQEAgLTIyMCw3ICsyMjAsNyBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfY3JlYXRl
X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZQogCQlyZXR1cm4g
cjsKIAogCWliID0gJmpvYi0+aWJzWzBdOwotCWR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsK
KwlkdW1teSA9IHJpbmctPmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ncHVfYWRkcjsKIAogCWliLT5s
ZW5ndGhfZHcgPSAwOwogCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7CkBA
IC0yODIsNyArMjgyLDcgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNn
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKIAkJcmV0dXJuIHI7CiAKIAlpYiA9ICZqb2ItPmli
c1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVtbXkgPSByaW5nLT5hZGV2
LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIgKyAxMjggKiBQQUdFX1NJWkU7CiAKIAlpYi0+bGVu
Z3RoX2R3ID0gMDsKIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDE4OwpAQCAt
MzI2LDkgKzMyNiwxNiBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2co
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogICovCiBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19y
aW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBsb25nIHRpbWVvdXQpCiB7CisJ
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OwogCXN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlID0gTlVMTDsKIAlsb25nIHI7CiAKKwlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJu
ZWwoYWRldiwgMiAqIDEyOCwgUEFHRV9TSVpFLAorCQkJQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwg
JmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ibywKKwkJCSZhZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1
X2FkZHIsICZhZGV2LT52Y24uZW5jX3Nlc3Npb25fY3B1X2FkZHIpOworCWlmIChyKQorCQlyZXR1
cm4gcjsKKwogCXIgPSB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0ZV9tc2cocmluZywgMSwgTlVMTCk7
CiAJaWYgKHIpCiAJCWdvdG8gZXJyb3I7CkBAIC0zNDUsNiArMzUyLDExIEBAIHN0YXRpYyBpbnQg
dXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcg
dGltZW91dCkKIAogZXJyb3I6CiAJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CisKKwlhbWRncHVfYm9f
ZnJlZV9rZXJuZWwoJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ibywKKwkJCQkgICZhZGV2LT52Y24u
ZW5jX3Nlc3Npb25fZ3B1X2FkZHIsCisJCQkJICAodm9pZCAqKikmYWRldi0+dmNuLmVuY19zZXNz
aW9uX2NwdV9hZGRyKTsKKwogCXJldHVybiByOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
