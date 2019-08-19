Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FE4926DF
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547B96E152;
	Mon, 19 Aug 2019 14:35:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60306E152
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keLuymdh5wj/rivtOlTZ7ONgBIOAYzN88jVgOs3eq7cJsGQqQ/Sy+16h0sSY2G5fUMV47QJsY3jORCVr5b3IwZV9ZGw2ZkRuIEB/2J6BZTkuMY6AWDSocGtXF+tgAN4cQgh5KXU0ThhqaXigDdjsHoKTloadUITao4sBlFzBQAa39PjfOBmJwtWXpdsccGs9SNmIn0R590Tor02LGdelaJ+0vaQixChroh3PfOF4vdAbfyDe8lJfgQfqnfvUd4A7dDVRcsw9s9GZ5nAxbA6HRaM0cOafdILMb1ojuDzL6yDpnQEL3n1qZ74SIk5SMx/PZIS7ikA6GoXyswujgr7mZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/utyQsdNEfNlFSX81f7fNizB4pnWex9zgRHXsC95Kc=;
 b=jffcMSJrxF1vGpz/15uLXuleZBs3K5g67ltaPigKWsgHHsxoECrz3+cn4QbWod8vTo4NmsbUXYQhczr1mK2z2x4Y6LvPD/IuKDro7Uj7iVQh4Ia0Mb5dgXphrZQ+8hTe6iw74bWQJ93sc9WiquwAcTooTsKpYat0En0fZjQH5W2MpDJYiNQzl+Ggn99D5xizb6PLABHcWz0xQv8h78CR/hsGKQ1Q0wwKcnDJWKqA4Jpg/a0Hgze/vLf+pXnebScOnSQmysHrH7tEsn8Z6TrIsKE22Z15tt0XIDE4LLGPRPmQRyFcNrOnCZCaoOMJgCY/heF7EdcK/pIGPET7elxySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Mon, 19 Aug 2019 14:35:43 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:42 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:40 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/36] drm/amd/display: fix MPO HUBP underflow with Scatter
 Gather
Date: Mon, 19 Aug 2019 10:34:43 -0400
Message-ID: <20190819143515.21653-5-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(199004)(189003)(53936002)(16586007)(305945005)(316002)(1076003)(5660300002)(53416004)(36756003)(50466002)(48376002)(47776003)(478600001)(2906002)(70586007)(70206006)(356004)(76176011)(51416003)(7696005)(336012)(186003)(26005)(2351001)(50226002)(8676002)(8936002)(81166006)(81156014)(6916009)(476003)(446003)(2616005)(11346002)(426003)(86362001)(4326008)(486006)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18039184-f9fa-42f5-6f61-08d724b283c6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12808B6155AFA41286265E2BF9A80@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3Fr1gpJThqoPmHBkU53vkJqc8hcUCh66TeomiPkUZ2T3/ZCXG9lcY9KNEw2MOIqqBDH/D5IVumVo6bJlHNrCq8fU4nm7gBWtBlQhlfxuX4D5f3zl6Peip1DUzrGmx3kPESDJ9tdTGEHjtp92xH3ck54EDgl7v3aY42X3XnlZhAryVDrKKv3bpTsVPF9KvTnqaWCNd+e1BQEiQhQolLSbyNOKGdAwAO1efS4zAjQF9U+tPNoTs4tT1HvvozCF6GBWcN9f5PUmbq8dmZH8NqAZYwOw+znpU0vs1h94jMpswpa+yGKjeb/HGkvDWXC00Sm9GzmJWx9nvduSUjQEpbyppYxraDHfPUsSNbJ7fwdavIcwdklLRNmwmieesBjHl+omR+CjYuknn1AzOQ6eeoCxpATPmU7JGd44IM9Y/nrKbow=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:42.8211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18039184-f9fa-42f5-6f61-08d724b283c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/utyQsdNEfNlFSX81f7fNizB4pnWex9zgRHXsC95Kc=;
 b=LQhw2oHdXPLXYjMgXsLpTSZ+6dMmgzECxIopA5dB2zGDO9lbPQjFTvwhXiSzKiSQmccii2o9LG4hdk0P2V9CBngn0UWH3uSUiibxaFyUB6dYL+l6qkQGmOITFuUxO75yK54oe/7llyZLZhDz43XY1tJmMJ/t+7tResbrf3AoFV4=
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
Cc: Zi Yu Liao <ziyu.liao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+Cgpbd2h5XQpXaXRoIFNjYXR0ZXIg
R2F0aGVyIGVuYWJsZWQsIEhVQlAgdW5kZXJmbG93cyBkdXJpbmcgTVBPIGVuYWJsZWQgdmlkZW8K
cGxheWJhY2suIGh1YnBfaW5pdCBoYXMgYSByZWdpc3RlciB3cml0ZSB0aGF0IGZpeGVzIHRoaXMg
cHJvYmxlbSwgYnV0CnRoZSByZWdpc3RlciBpcyBjbGVhcmVkIHdoZW4gSFVCUCBnZXRzIHBvd2Vy
IGdhdGVkLgoKW2hvd10KTWFrZSBhIGNhbGwgdG8gaHVicF9pbml0IGR1cmluZyBlbmFibGVfcGxh
bmUsIHNvIHRoYXQgdGhlIGZpeCBjYW4KYmUgYXBwbGllZCBhZnRlciBIVUJQIHBvd2VycyBiYWNr
IG9uIGFnYWluLgoKU2lnbmVkLW9mZi1ieTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBC
aGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCA2ODdkNjcwZmJkNWQuLmFlZTYy
NDM3MTcyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h3c2VxLmMKQEAgLTkzOCw2ICs5MzgsOSBAQCB2b2lkIGRjbjIwX2VuYWJsZV9wbGFu
ZSgKIAkvKiBlbmFibGUgRENGQ0xLIGN1cnJlbnQgRENIVUIgKi8KIAlwaXBlX2N0eC0+cGxhbmVf
cmVzLmh1YnAtPmZ1bmNzLT5odWJwX2Nsa19jbnRsKHBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicCwg
dHJ1ZSk7CiAKKwkvKiBpbml0aWFsaXplIEhVQlAgb24gcG93ZXIgdXAgKi8KKwlwaXBlX2N0eC0+
cGxhbmVfcmVzLmh1YnAtPmZ1bmNzLT5odWJwX2luaXQocGlwZV9jdHgtPnBsYW5lX3Jlcy5odWJw
KTsKKwogCS8qIG1ha2Ugc3VyZSBPUFBfUElQRV9DTE9DS19FTiA9IDEgKi8KIAlwaXBlX2N0eC0+
c3RyZWFtX3Jlcy5vcHAtPmZ1bmNzLT5vcHBfcGlwZV9jbG9ja19jb250cm9sKAogCQkJcGlwZV9j
dHgtPnN0cmVhbV9yZXMub3BwLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
