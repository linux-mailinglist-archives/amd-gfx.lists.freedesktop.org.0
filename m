Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298F184647
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2020 12:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B386EBD0;
	Fri, 13 Mar 2020 11:53:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F46EBCE
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2020 11:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXEjKoqNCRAOdB6k0qu8bXoBK2bfUnVuuCWUmKh0WNRFFo6lBikFQWD9XsqFhODUqyDL3X2gxHbjOATmdimfIHY9K/xeycoUbqQ3XeQqvLJnqFxwXKTZt7zBgvfr9g3SkA/r+Ti5CT/slIVwog4yqhFopmZsfl/wEnkIFMghuyNdXDOkLGfxVYNr9RnJaksKzsjmrYau4BOIk9ra/xUwsqSJCpJyNmi4/LK4A+09GgwuAMx0DgFt1Ipfw/89j1N6wFrWm9ARbbdilZYCfbrMTSlTpNiQuI/DYqAocSjIlHV29ujOR+leTt4Pfi09dmDh64dLmx7YRWX6XAilPA9tSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TcsBCxveovb5ZNUAfZSh/PMq12EJMJc3rVygq9wVO8=;
 b=jcrrw/yVWTUrkNQ+RKaKOdz3vJM9JtidsrK4GCi8BcXgMEMukqUoJuK3sQxyJ9/IYdG7hYDUcx5Sd2/G/Q6aHWR8zqbCuLWJ0Kg4mlTKLDT/sVens/vCTgWbCCXT+S0qm5chkkxoIxSZOcdxw5f9YOXYqOHLaJLr35nU2tzVg9UdxljHwe8jRIF3Y6oYSoIE0EZxnCf1ereIen5YgQMmMcIq9+fNwA+oooDjq0u5/MrZuaACz2M8Ih/JvZutgq5rGQDB9D4bCRpQ6jXbBZnnsdQIBq0VICY2CnRWrazWuIrKMommXdjuNS6ga8EYw2Et+uBhYnxEwjHKNVh4DBPuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TcsBCxveovb5ZNUAfZSh/PMq12EJMJc3rVygq9wVO8=;
 b=LulBngeIMD69irZRafHsF8T3EmyrJO1TRD6NoJqxR/x//5Fn7I+8ICm2218DEi/xE7fMTXn1FKqWnKzKX+njnPP+To2JFfO0g90IH9x2K9DyM5sybvXz0pl4QkGIMuI76/3rzSNYTnXITJNg3H5HhHdi8ZncfXuEE8kNLadZXKU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 by SN6PR12MB2734.namprd12.prod.outlook.com (2603:10b6:805:76::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Fri, 13 Mar
 2020 11:53:27 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::f458:67f4:2379:b6da]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::f458:67f4:2379:b6da%5]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 11:53:27 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: unref the bo after job submit
Date: Fri, 13 Mar 2020 19:53:05 +0800
Message-Id: <20200313115305.32325-2-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313115305.32325-1-xinhui.pan@amd.com>
References: <20200313115305.32325-1-xinhui.pan@amd.com>
X-ClientProxiedBy: HK2PR0302CA0017.apcprd03.prod.outlook.com
 (2603:1096:202::27) To SN6PR12MB2800.namprd12.prod.outlook.com
 (2603:10b6:805:6c::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (180.167.199.189) by
 HK2PR0302CA0017.apcprd03.prod.outlook.com (2603:1096:202::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.10 via Frontend Transport; Fri, 13 Mar 2020 11:53:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd1ca350-7dcf-4545-94db-08d7c7452467
X-MS-TrafficTypeDiagnostic: SN6PR12MB2734:|SN6PR12MB2734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB273418CFFE94E436BD7D4EAB87FA0@SN6PR12MB2734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:378;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(199004)(1076003)(26005)(86362001)(36756003)(5660300002)(6916009)(478600001)(66574012)(6666004)(81156014)(4326008)(52116002)(7696005)(81166006)(2906002)(8676002)(8936002)(66556008)(66946007)(16526019)(6486002)(2616005)(66476007)(186003)(316002)(54906003)(956004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2734;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txhOQdnI0f1Ig0LwaZZvEeo/nkjrNLGqaCleLezpwKGu/xWFNmi/jwAltKO2gjEgQGSINxZ3SOmujevVrQ75hI8y2WzueIvZuj0J0af8v42zEI7EKeXgt26xp9GQL654jE3p7P8CJNOwxN203JQ/GKHXgk7C9ow2TdYwumkktHD/o+EBwDVQLp3Sjp0j4RSbK4MtteRG5CDlCEed9ldRf12xexfHxzYjApIpvDjfyhkxxvi8fuouI21b04jATT0ZFWYjfRTb9qZ0wVE96N48s3l7CF0Gx8hTpCuLk+BOjJF6k4UcIdu1pbNh29PCEGab/MpTJhhAbN5y3OF0d2Zlrxg0jx952UvRYh5RpWvgaUq89W3+lyGYIoqCuHDNcxAevd3BmkDDR+VbSxPjl/qBBm45+zz67dmX7y3Fj9Zv2eGa41ibT2FK9cRESR1i3jZQ
X-MS-Exchange-AntiSpam-MessageData: duI/76WhfJPWMONHPK/+Su9E40eLyfHWWEO76bUWmGF5LKnlZHpEgn+1PMGRCcrnTMxvqMWajEQbaoB9fbcO1+X4OmP7KJMysSj8JEAvhC9qftH9I4DA/jxswvaV1DZb1IobAgeOF+Sl80wABlU8Ag==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1ca350-7dcf-4545-94db-08d7c7452467
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 11:53:27.5862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWos/Ejm+B1LwmrcCkkX3saVpALPbFL2UnAdKNCbS8WnZROIYBm8hVYJ4v5Zenow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2734
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T3RoZXJ3aXNlIHdlIG1pZ2h0IGZyZWUgQk9zIGJlZm9yZSBqb2IgaGFzIGNvbXBsZXRlZC4KV2Ug
YWRkIHRoZSBmZW5jZSB0byBCTyBhZnRlciBjb21taXQsIHNvIGZyZWUgQk9zIGFmdGVyIHRoYXQu
CgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1
aS5wYW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyB8IDI5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYwppbmRleCA3MzM5ODgzMTE5NmYuLmNkZmMyNjUzNWM3ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTk0MiwxMyArOTQyLDE3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3ZtX2FsbG9jX3B0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqCiAgKiBA
ZW50cnk6IFBERSB0byBmcmVlCiAgKi8KLXN0YXRpYyB2b2lkIGFtZGdwdV92bV9mcmVlX3RhYmxl
KHN0cnVjdCBhbWRncHVfdm1fcHQgKmVudHJ5KQorc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2ZyZWVf
dGFibGUoc3RydWN0IGFtZGdwdV92bV9wdCAqZW50cnksCisJCQkJCXN0cnVjdCBsaXN0X2hlYWQg
KmhlYWQpCiB7CiAJaWYgKGVudHJ5LT5iYXNlLmJvKSB7CiAJCWVudHJ5LT5iYXNlLmJvLT52bV9i
byA9IE5VTEw7CiAJCWxpc3RfZGVsKCZlbnRyeS0+YmFzZS52bV9zdGF0dXMpOwotCQlhbWRncHVf
Ym9fdW5yZWYoJmVudHJ5LT5iYXNlLmJvLT5zaGFkb3cpOwotCQlhbWRncHVfYm9fdW5yZWYoJmVu
dHJ5LT5iYXNlLmJvKTsKKwkJaWYgKCFoZWFkKSB7CisJCQlhbWRncHVfYm9fdW5yZWYoJmVudHJ5
LT5iYXNlLmJvLT5zaGFkb3cpOworCQkJYW1kZ3B1X2JvX3VucmVmKCZlbnRyeS0+YmFzZS5ibyk7
CisJCX0gZWxzZQorCQkJbGlzdF9hZGQoJmVudHJ5LT5iYXNlLnZtX3N0YXR1cywgaGVhZCk7CiAJ
fQogCWt2ZnJlZShlbnRyeS0+ZW50cmllcyk7CiAJZW50cnktPmVudHJpZXMgPSBOVUxMOwpAQCAt
OTY1LDcgKzk2OSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9mcmVlX3RhYmxlKHN0cnVjdCBh
bWRncHVfdm1fcHQgKmVudHJ5KQogICovCiBzdGF0aWMgdm9pZCBhbWRncHVfdm1fZnJlZV9wdHMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkgICAgICAgc3RydWN0IGFtZGdwdV92bSAq
dm0sCi0JCQkgICAgICAgc3RydWN0IGFtZGdwdV92bV9wdF9jdXJzb3IgKnN0YXJ0KQorCQkJICAg
ICAgIHN0cnVjdCBhbWRncHVfdm1fcHRfY3Vyc29yICpzdGFydCwKKwkJCQkgICBzdHJ1Y3QgbGlz
dF9oZWFkICpoZWFkKQogewogCXN0cnVjdCBhbWRncHVfdm1fcHRfY3Vyc29yIGN1cnNvcjsKIAlz
dHJ1Y3QgYW1kZ3B1X3ZtX3B0ICplbnRyeTsKQEAgLTk3MywxMCArOTc4LDEwIEBAIHN0YXRpYyB2
b2lkIGFtZGdwdV92bV9mcmVlX3B0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAl2bS0+
YnVsa19tb3ZlYWJsZSA9IGZhbHNlOwogCiAJZm9yX2VhY2hfYW1kZ3B1X3ZtX3B0X2Rmc19zYWZl
KGFkZXYsIHZtLCBzdGFydCwgY3Vyc29yLCBlbnRyeSkKLQkJYW1kZ3B1X3ZtX2ZyZWVfdGFibGUo
ZW50cnkpOworCQlhbWRncHVfdm1fZnJlZV90YWJsZShlbnRyeSwgaGVhZCk7CiAKIAlpZiAoc3Rh
cnQpCi0JCWFtZGdwdV92bV9mcmVlX3RhYmxlKHN0YXJ0LT5lbnRyeSk7CisJCWFtZGdwdV92bV9m
cmVlX3RhYmxlKHN0YXJ0LT5lbnRyeSwgaGVhZCk7CiB9CiAKIC8qKgpAQCAtMTQyOCw3ICsxNDMz
LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2ZyYWdtZW50KHN0cnVjdCBhbWRncHVfdm1fdXBk
YXRlX3BhcmFtcyAqcGFyYW1zLAogICovCiBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRl
cyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKIAkJCQkgdWludDY0X3Qg
c3RhcnQsIHVpbnQ2NF90IGVuZCwKLQkJCQkgdWludDY0X3QgZHN0LCB1aW50NjRfdCBmbGFncykK
KwkJCQkgdWludDY0X3QgZHN0LCB1aW50NjRfdCBmbGFncywKKwkJCQkgc3RydWN0IGxpc3RfaGVh
ZCAqaGVhZCkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBhcmFtcy0+YWRldjsK
IAlzdHJ1Y3QgYW1kZ3B1X3ZtX3B0X2N1cnNvciBjdXJzb3I7CkBAIC0xNTM5LDcgKzE1NDUsNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0
ZV9wYXJhbXMgKnBhcmFtcywKIAkJCSAqIGNvbXBsZXRlbHkgY292ZXJlZCBieSB0aGUgcmFuZ2Ug
YW5kIHNvIHBvdGVudGlhbGx5IHN0aWxsIGluIHVzZS4KIAkJCSAqLwogCQkJd2hpbGUgKGN1cnNv
ci5wZm4gPCBmcmFnX3N0YXJ0KSB7Ci0JCQkJYW1kZ3B1X3ZtX2ZyZWVfcHRzKGFkZXYsIHBhcmFt
cy0+dm0sICZjdXJzb3IpOworCQkJCWFtZGdwdV92bV9mcmVlX3B0cyhhZGV2LCBwYXJhbXMtPnZt
LCAmY3Vyc29yLCBoZWFkKTsKIAkJCQlhbWRncHVfdm1fcHRfbmV4dChhZGV2LCAmY3Vyc29yKTsK
IAkJCX0KIApAQCAtMTU4Miw2ICsxNTg4LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBk
YXRlX21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJc3RydWN0IGFtZGdwdV92
bV91cGRhdGVfcGFyYW1zIHBhcmFtczsKIAllbnVtIGFtZGdwdV9zeW5jX21vZGUgc3luY19tb2Rl
OwogCWludCByOworCXN0cnVjdCBsaXN0X2hlYWQgaGVhZDsKIAogCW1lbXNldCgmcGFyYW1zLCAw
LCBzaXplb2YocGFyYW1zKSk7CiAJcGFyYW1zLmFkZXYgPSBhZGV2OwpAQCAtMTU4OSw2ICsxNTk2
LDggQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJcGFyYW1zLmRpcmVjdCA9IGRpcmVjdDsKIAlwYXJhbXMucGFnZXNf
YWRkciA9IHBhZ2VzX2FkZHI7CiAKKwlJTklUX0xJU1RfSEVBRCgmaGVhZCk7CisKIAkvKiBJbXBs
aWNpdGx5IHN5bmMgdG8gY29tbWFuZCBzdWJtaXNzaW9ucyBpbiB0aGUgc2FtZSBWTSBiZWZvcmUK
IAkgKiB1bm1hcHBpbmcuIFN5bmMgdG8gbW92aW5nIGZlbmNlcyBiZWZvcmUgbWFwcGluZy4KIAkg
Ki8KQEAgLTE2MTcsNyArMTYyNiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9t
YXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWlmIChyKQogCQlnb3RvIGVycm9y
X3VubG9jazsKIAotCXIgPSBhbWRncHVfdm1fdXBkYXRlX3B0ZXMoJnBhcmFtcywgc3RhcnQsIGxh
c3QgKyAxLCBhZGRyLCBmbGFncyk7CisJciA9IGFtZGdwdV92bV91cGRhdGVfcHRlcygmcGFyYW1z
LCBzdGFydCwgbGFzdCArIDEsIGFkZHIsIGZsYWdzLCAmaGVhZCk7CiAJaWYgKHIpCiAJCWdvdG8g
ZXJyb3JfdW5sb2NrOwogCkBAIC0zMTE4LDcgKzMxMjcsNyBAQCB2b2lkIGFtZGdwdV92bV9maW5p
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKIAkJYW1k
Z3B1X3ZtX2ZyZWVfbWFwcGluZyhhZGV2LCB2bSwgbWFwcGluZywgTlVMTCk7CiAJfQogCi0JYW1k
Z3B1X3ZtX2ZyZWVfcHRzKGFkZXYsIHZtLCBOVUxMKTsKKwlhbWRncHVfdm1fZnJlZV9wdHMoYWRl
diwgdm0sIE5VTEwsIE5VTEwpOwogCWFtZGdwdV9ib191bnJlc2VydmUocm9vdCk7CiAJYW1kZ3B1
X2JvX3VucmVmKCZyb290KTsKIAlXQVJOX09OKHZtLT5yb290LmJhc2UuYm8pOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
