Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D387857
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA006ED8A;
	Fri,  9 Aug 2019 11:27:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4E26ED8A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMfWxPKVcd34h59B8Huhw7usOM8z2lmGshwPCG6v+DR9eCRr6PrAkRoilE2VS1qOodNkwEnAa/dHpqOxf3CBNN41UMP0jEGNBzD6g6vMD5femW3QelFwYIuOoBid5rQwrLWWDNFISYuDhJsElvs/ppWJCTPCy+vK+SEbW/L/XdfZAWTIlHPlauSYzgoceugTeDmOWV3aYE5SGzvDfhUX5WRYupiIEp71UaYOJtZmo18lbBw0DQuECw6/dUUpQf0O5ZKa88BSeQ3ZMMSRIF4RWDXtAKupkxk812/+wS7LXIqwRv7Ccg8fW/Ldd6bxcayJIoTKTb6rOH6k/9anBNvrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS/abr4YuGCU9RlfBdgcarwZ+PdAdLd09CDOOw1wO2E=;
 b=Dx6v8TYFBdQDCGjt26VxbfLLD74B1CFa/jjH/VRdJFoE+/XKOYmUDW9pxcLZgduBo+/beT7gJrw/zQFsH5fnaVMocU4uYwM7tZ3cLboFw0RKyRE+GTNb9VUjZMcM9GbZAwyaO+feuOTh++Ip0kc2CRwO4Xa1MzUR/wcUftq3m3uy5UiKG/fmA0oJhlXMT1vPub5CCjybcoTf6suovW7vi7fVWNokB0mgCMFJU/wzhfxunqQKHfXaTjwek7JYIeBXhDi0Qgl4+WCJfglIUXHE6p825VB9ovInza7j+fkwq+j4/oXmSfyjPwt3UJF/Ak9Il97zcNshC5ppEOoleCeLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0035.namprd12.prod.outlook.com (2603:10b6:903:129::21)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Fri, 9 Aug
 2019 11:27:03 +0000
Received: from DM3NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CY4PR12CA0035.outlook.office365.com
 (2603:10b6:903:129::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13 via Frontend
 Transport; Fri, 9 Aug 2019 11:27:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT046.mail.protection.outlook.com (10.152.83.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 11:27:02 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 06:27:01 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus
Date: Fri, 9 Aug 2019 19:26:53 +0800
Message-ID: <1565350016-7071-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(346002)(376002)(136003)(2980300002)(428003)(199004)(189003)(50466002)(2906002)(4326008)(126002)(356004)(2351001)(486006)(6666004)(2616005)(70206006)(16586007)(44832011)(47776003)(476003)(305945005)(50226002)(53936002)(48376002)(316002)(5660300002)(86362001)(8936002)(6916009)(426003)(81156014)(51416003)(336012)(478600001)(186003)(81166006)(26005)(4744005)(70586007)(36756003)(49486002)(8676002)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75dc9e07-cda6-4ffa-ca6a-08d71cbc8045
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706A17452A68F98B6DD7A60F6D60@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SlFQIwVtPFe5RB1aFUmU6wbmy7q/1z0W7JQoDyyn5nb7PCSf5Nv6RgV3ZLnN1FdjfVo3NuAaLRQQNejCNOu1y3zimhoxFxbrm5L9V8MCYoEybF2A3VeWRUbpf21zSxkxTJ7u55eE5sUiuEFo6ttilr+uoXeWQqHulSUwMgNm077qJxKfk0fUM03y9DNZIbY3r3J4kcoI79Xwf77qJWCjbBw8QVqe+3p4PTfhnt0o5luVUvaCte3atkBgQ9HYMg0Wt/bsUT90tWsbkNVB2oZA4MO6zSJrczknxhuJp354+bgiVmuE5HA23m+AgVmKaCaJ9dD2C7CS9hNFwVHTJat6d7DZV1qA4XqQ54TWzYyVzefJtHioYok4JqwfrSGDnuZMGDchlPsjnnmm6QN96ED1mNP2pTopWDHFITxN+8oyw3o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 11:27:02.5859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dc9e07-cda6-4ffa-ca6a-08d71cbc8045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS/abr4YuGCU9RlfBdgcarwZ+PdAdLd09CDOOw1wO2E=;
 b=vPaOcmEHG9H5fqbwqPu9R+kRgFliAzf2H6bH+ZsJFGU2ANT3ySFqjiz1IAdQcxF86GCuVAAWn+nXT5xrWnmOiGd9/9rUKdnKn8sURToRQRC9a9fLV40YxoSxKEsd6ysUy1TpFTRs8eBE8lbYUH83VXRTpnYoW5+kHU2/50KorfY=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWlzc2VkIEFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyBhY2NpZGVudGx5IHdoZW4gY29tbWl0IHBh
dGNoIGJlZm9yZQogICAgZHJtL2FtZGdwdTogZW5hYmxlIGdmeCBjbG9jayBnYXRpbmcgZm9yIEFy
Y3R1cnVzCgpDaGFuZ2UtSWQ6IEk5ZDcwMzE5ZGQwN2Y3ZDY0MjQxNmNiMjYwZjlmNWIzMzQyYjZm
M2YyClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDI2MTQ5M2EuLmFlY2JhMWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTEyMiw2ICsxMTIyLDcgQEAgc3Rh
dGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQlBTURfQ0df
U1VQUE9SVF9HRlhfTUdMUyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9HRlhfQ0dDRyB8CiAJCQlBTURf
Q0dfU1VQUE9SVF9HRlhfQ0dMUyB8CisJCQlBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgfAogCQkJ
QU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfAogCQkJQU1EX0NHX1NVUFBPUlRfSERQX0xTIHwKIAkJ
CUFNRF9DR19TVVBQT1JUX1NETUFfTUdDRyB8Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
