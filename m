Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A778DF04
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B856E83B;
	Wed, 14 Aug 2019 20:40:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CE6E83B
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXlcnkaJ1VUQ/3yKcbpT9+Q/83CUtLv4dYfCjjKsqJo+h16jB7me6IxZI9r5heIsWcHo0r5D6INoHROUVB/RsFznmfZDkW1ZnKrcvipeur6hIgL+i6YSLC1LOZaEH9+bUzrb/ktQfkAydiOtJ4KZpMo/cymZK5pyrwe3IGLk1NexvrlL+VaRrQgMuywdPFQKMQxU5dyfBAUrNBMYw2YqnpxvH8l7tNexDFv3a3Sl0Vy0PkHxrVgI4Ny/nEzFqNUtSjtF+JfIQN0UQoC4SzP039PxZOOKvJnf9PiCcB+5X1mM1Z55vEO1GKYjurF8LfZR5FslgwaR7IqmVetX+XloTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEHtkiJXQmJrP24+VnRdgdO+fIWMNvdCtLOvlyvk15A=;
 b=kLEQnCJpxX2FLC7jyxLkna9UqRPJt9ddlslaUGzW4vt+PA4RU+LIj4fpXNSUDosgThnEIQyqscmeyCBGj3RM7uCbtqVRBs3splsMN1MHcDxMt5qQr023HyeMULAJuDnqXF0k/hPzBSmupfx30G/mtDwqvLNcyVD5paYG3M1M+iGeV0HseFC3ovwZieBGWEwY4tQ5DxiSXovw/1lDyecLhEiV/CcLU2Lb18ScAGIOdPWS6OASqJiKBuoJBy11/jW3cku6jvd2FEK2yrwKYq5FFJkkfL1yXiq6JeawoYYmiLHyR/X1Z6gBlgwhfQD5lh6Sd6PfyohhMYSWVjSXCaKRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Wed, 14 Aug 2019 20:40:26 +0000
Received: from CO1NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT034.mail.protection.outlook.com (10.152.80.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:25 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:24 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 0/5] Add mode 2 GPU reset for RV2/Picasso
Date: Wed, 14 Aug 2019 16:40:12 -0400
Message-ID: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(51416003)(486006)(70206006)(44832011)(47776003)(2351001)(50226002)(5660300002)(4744005)(305945005)(7696005)(478600001)(316002)(6916009)(70586007)(26005)(16586007)(50466002)(8936002)(48376002)(2906002)(426003)(336012)(476003)(2616005)(54906003)(53936002)(53416004)(126002)(8676002)(81156014)(81166006)(186003)(86362001)(4326008)(356004)(36756003)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a4a435f-685c-4bf0-e2a4-08d720f7a2dc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1269151262D4EB54390B9724EAAD0@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LQr67sWychP3ppaEYWOujLTrN/kUgNIOukZc3CvFFpI3BHm2Mrq6lG/ybiTr6ShtS3cGojfkmhbQOO3qopId1S+PzfPGDXenhDSTnzvB1L2RHhA4qy801a0VmGkH05EBozWRbRVNa7741PkFrC5s75JtDf3UUI6debH4939v95+eFuz9JpsrngFGEUEc6DPTYkzkduEiu74rZkbBi+PgE0DXQpUS7k6HJsGmOZ2465sE6+7kOzp8PvshElWZwLgrUpvZICgk/jPWIzXn9Zt6TdnS/S6IUnjH46JoLgwMV4/S8rxFFq1RJXZn3D6wRjkf9Tcjjx4UNLeQnA3asS16FKqKChX9KckPoq0Z2F7IMw77rfPRV5B+mymNqdGurXXpu/oQkMa4yVyE/O/anEW4Y/Imnma+NWgQHONiLl1qY4I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:25.5588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4a435f-685c-4bf0-e2a4-08d720f7a2dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEHtkiJXQmJrP24+VnRdgdO+fIWMNvdCtLOvlyvk15A=;
 b=v4alMRQeYjp6rnRpgD7iNJIgDA+uRuHGlHnqgiMQlpMvI3IAOUKa7exleM7Fqlt70HMgRUKPqvXMQv+Xq4pc2quz9kcAXOdH/mysE8dwLTKgE6TrY95AAL6RLmikCTK8FXYTd8i8Q0OGWmBC8hX+2ntLbfCwXMvrhO/BuBOXRlE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBhZGRzIG1vZGUgMiByZXNldCB0aHJvdWdoIFNNVSBmb3IgUlYyIGFuZCBQ
aWNhc3NvLgoKdjI6ClNwbGl0IGludG8gbW9yZSBwYXRjaGVzIHBlciBmdW5jdGlvbmFsIHVuaXQu
CkFkZCBzb21lIE5VTEwgY2hlY2tzIGFuZCBmaXggdHlwb3MuCgpBbmRyZXkgR3JvZHpvdnNreSAo
NSk6CiAgZHJtL2FtZC9wb3dlcnBsYXk6IEZpeCBtZWFuaW5nIG9mIDB4MUUgUFBTTUNfTVNHCiAg
ZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBtb2RlMiByZXNldCBjYWxsYmFjayBmb3IgcHBfc211X21n
cgogIGRybS9hbWQvcG93ZXJwYXk6IEltcGxlbWVudCBtb2RlMiByZXNldCBjYWxsYmFjayBmb3Ig
U01VMTAKICBkcm0vYW1kL3Bvd2VwbGF5OiBBZGQgYW1kX3BtX2Z1bmNzIGNhbGxiYWNrIGZvciBt
b2RlIDIKICBkcm0vYW1kZ3B1OiBVc2UgbmV3IG1vZGUyIHJlc2V0IGludGVyZmFjZSBmb3IgUlYu
CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgICAgICB8ICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgICAgICAgICAgfCAy
NSArKysrKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tn
ZF9wcF9pbnRlcmZhY2UuaCAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZF9wb3dlcnBsYXkuYyAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jIHwgIDcgKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmggICAgICAgICB8ICA5ICsrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvcnZfcHBzbWMuaCAgICAgIHwg
IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
