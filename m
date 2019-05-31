Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C99311F1
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3189237;
	Fri, 31 May 2019 16:05:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760048.outbound.protection.outlook.com [40.107.76.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297489155
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:05:33 +0000 (UTC)
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15; Fri, 31 May
 2019 16:05:31 +0000
Received: from DM3NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Fri, 31 May 2019 16:05:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT029.mail.protection.outlook.com (10.152.82.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Fri, 31 May 2019 16:05:30 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 31 May 2019
 11:05:29 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Add back missing hw translate init for
 DCN1_01
Date: Fri, 31 May 2019 12:05:26 -0400
Message-ID: <20190531160526.28279-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(7696005)(336012)(6916009)(26005)(44832011)(54906003)(48376002)(2616005)(476003)(126002)(50466002)(36756003)(186003)(68736007)(356004)(426003)(486006)(6666004)(305945005)(77096007)(5660300002)(47776003)(1076003)(8936002)(70206006)(8676002)(81166006)(53936002)(2906002)(50226002)(4326008)(72206003)(2351001)(81156014)(16586007)(51416003)(86362001)(70586007)(53416004)(478600001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2672; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ba0e72f-17d5-49ca-df05-08d6e5e1ce0c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2672; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2672:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2672747BFB73BF6DBD71B81EEC190@SN6PR12MB2672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 00540983E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SmVMMzXlKuU6mSsJKsEsSFraaj4JQWjXiJ7JMgj6xOA7YlxQiNPB6J0GvFu/g1A46tYY3xSyBTxZvCWnAx+ik/ANN77AyzfA7b/oGs2f6IRzC2zlCd2SLmbBPt7w2yg7kuXpxy9MqvMHIuHSY0DZpVAmufBYFVbfhAdMc7PE6fYNzwnaHL5So3A5NnZvioOWUM041u1ehn02WDqig7Cy+XrjzhZSksJOgn38NUnxH7mvVVwZQyxDtWwDHEne4qCxnIjsfI0DvZpkRDHJ6l11gTrG8uYvypRD5dq6dsdxHpBt2NF2D+BhFfq5Uok3XB735tzZChw4x9SNC7h93Zpec2LwCX/RopPxVWGZEv3pcE3tttKveZTGwmyiofBjtiI0260BPpGUEDSEYOxVbOhqMnKy7VQF1dH1nCraTOoGalQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2019 16:05:30.5735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba0e72f-17d5-49ca-df05-08d6e5e1ce0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBZC/TUq5FFoOnDkf+aNDb7gHdWkRsir+rcbc0j2krg=;
 b=m76NeZct/vJj0sIRAVSUUVNhuoy1NsKZNDl1n8vi/mF0JrEjq4iooh738aPcxBbk00xjnOXoBPzJOBToxNdQa5GVhMUAq0HqphPg3A6fph+c4ttQJlJ0rPewkhBx1mNXiDSPvGvl7JKDbAep0qfATdxB4/KEQBYwhuvLCIphvhE=
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
Cc: Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KRENOX1ZFUlNJT05fMV8wMSBpcyBubyBsb25nZXIgaGFuZGxlZCBpbiB0aGUgZGFsX2h3
X3RyYW5zbGF0ZV9pbml0CnN3aXRjaCBzaW5jZSBpdCB3YXMgaW5hZHZlcnRlbnRseSBkcm9wcGVk
IGluIHRoZSBwYXRjaCB0aGF0IHJlbW92ZWQgdGhlCnVubmVjZXNzYXJ5IERDTjFfMDEgZ3VhcmRz
LgoKVGhpcyBjYXVzZWQgbnVtZXJvdXMgcmVncmVzc2lvbnMgb24gRENOMV8wMSB3aGVuIGxvYWRp
bmcgdGhlIGRyaXZlci4KCltIb3ddCkFkZCBpdCBiYWNrLgoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgpGaXhlczogOTdkZjQyNGZlN2E3ICgiZHJtL2FtZC9kaXNw
bGF5OiBEcm9wIERDTjFfMDEgZ3VhcmRzIikKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9ncGlvL2h3X3RyYW5zbGF0ZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZ3Bpby9od190cmFuc2xhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9n
cGlvL2h3X3RyYW5zbGF0ZS5jCmluZGV4IDc3NjE1MTQ2Yjk2ZS4uMWY5ODMzZGM4Y2ZlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od190cmFuc2xhdGUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od190cmFuc2xhdGUu
YwpAQCAtODEsNiArODEsNyBAQCBib29sIGRhbF9od190cmFuc2xhdGVfaW5pdCgKIAkJcmV0dXJu
IHRydWU7CiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzApCiAJY2FzZSBEQ05f
VkVSU0lPTl8xXzA6CisJY2FzZSBEQ05fVkVSU0lPTl8xXzAxOgogCQlkYWxfaHdfdHJhbnNsYXRl
X2RjbjEwX2luaXQodHJhbnNsYXRlKTsKIAkJcmV0dXJuIHRydWU7CiAjZW5kaWYKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
