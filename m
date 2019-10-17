Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9152DB739
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096D16EAA5;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A166EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBWIhoT/t6fUVTpCqWtTrz30935uZGxw11VY4MfcW77VJqM3hNitWs073kzdaxKM3kfzRtXIV6hIioOd8MkbZ1+nRq7PlqaAAepxCUJVzt08oBQ4uSTfIrSZXq9cxBJ82ayCyHFxf06QwGrwa/0+sDoa2B4YWHdNZSGARrOzXyVxeJiJQ0ILXM8129SYpFvnTQcF9WCUli5Kkefxv/Y21cfPjAD9TTV5gHBJewmm0ci8lst2vZn49Xqmlt5dOdfY57k/q+LqaP/XUN5BEsKuo5pdibuMu18SjS8+xj5AxSoocAcSB/TE2WcLvvkICVRr9UGZ/d+As8A6TkgrChtKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtiqubobSwlHijEz85/2mO67frzz5VgViRfjt4vfXE8=;
 b=i5tME/EtlzyqGEH4lAITenx62hQ7HGKzejgfpM20jebxaR1ajILeX7UwU/RmuaNiePtR2NbCC9zZAefwWflMaJLHli8g5C3rryj8Q608Iy0G2JeRNJ9ULh34GoOlXgVlbidWtnUO2J1KdzplXZm9Zr3Nwzdlv3uFJ9kElPsrXtoUI719lockWRoIV/kfuVWszHHZLQQ9d3dw40Xg9zVN1uB6fuOGGbs6C9vuOhNrSrraI/nFoWYFBjsObiNLswn7OBxb8LWcmqtYDHI+bE4IamqzCJpbWl7D8aJWdycqyzBuExQISDob3qfN0z7RDv08tiH7tJFi3QUH82CBwbu5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:60::35)
 by SN6PR12MB2783.namprd12.prod.outlook.com (2603:10b6:805:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:45 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN8PR12CA0022.outlook.office365.com
 (2603:10b6:408:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:44 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:41 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/37] drm/amd/display: fix number of dcn21 dpm clock levels
Date: Thu, 17 Oct 2019 15:13:12 -0400
Message-ID: <20191017191329.11857-21-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(428003)(189003)(199004)(48376002)(47776003)(70586007)(2906002)(50226002)(11346002)(51416003)(426003)(446003)(186003)(356004)(6916009)(76176011)(26005)(70206006)(50466002)(2351001)(336012)(5660300002)(81156014)(2870700001)(6666004)(478600001)(8936002)(1076003)(4744005)(8676002)(316002)(4326008)(86362001)(486006)(54906003)(2876002)(36756003)(81166006)(476003)(305945005)(2616005)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2783; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b87a18c2-fdf8-4151-2e72-08d7533668ca
X-MS-TrafficTypeDiagnostic: SN6PR12MB2783:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27838E1C8D40EEC78D1BB9DD826D0@SN6PR12MB2783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pL3dSvton/+knV5xd/Ir7JPsuLPJ/JiyV3YLiUTwvN7GKhBCKpJF4tCfsXraHYKhzhKBp7caac013Jjc4qwMoFgHmygQ7w9UuRS3xFwjxCifqR83KFkh4jjBke9V8LFqZA0fepxHkb2NUnoDd4pXIa4JqjcmD+KYhO/QzKZ5I1SwRuTUbSs5/J3mn6SaPRiVcdOS95KGRcjyIWpVnXftR/yf6f4t5ffZk2HmfSGFU4yORfNk/DQUbi3fRlulKwjM2WkSH1+CdA0/TLk0C5w1SqwPudbSatPh7iA3/NdjIrOoiYnjlU/6QTMwNWbdbeT+sqUfc8v7VONZlf76rIu/CR7wlHWMeEc5M6xtReTdnYFtndz7rtpQx9kwPlw4eLaEBjl/gOcGrZRiNbZT7lZ+6cQ8N1pD5E/kDYjhxNdXvRg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:44.6303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87a18c2-fdf8-4151-2e72-08d7533668ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2783
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtiqubobSwlHijEz85/2mO67frzz5VgViRfjt4vfXE8=;
 b=o/NA7xTelRiOzvwwdP3T+fEGEcd3bC2Or9houWua65lMsrQmU9QPbI3V3Yi6Gtd80S+sSTtwpUdPlYk5yziciqQRTHLkgg9E+XuB27HhTov43EOlfgIKKsk3t8b/eLwpsv+iaRz/fNe0pdIQ8fNnIq3gMW/YlAl3NcJQ0sg5TFk=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClRo
ZXNlIGFyZSBzcGVjaWZpYyB0byBkY24yMSBhbmQgc2hvdWxkIG5vdCBiZSBpbmNyZWFzZWQgZm9y
CnJldXNlIG9uIG90aGVyIGFzaWNzLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2lu
IDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzIFBhcmsgPENo
cmlzLlBhcmtAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fcHBfc211LmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fcHBfc211LmgKaW5kZXggYjAxZGI2MWI2MTgxLi5l
ZjdkZjllZjZkN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bV9wcF9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fcHBfc211
LmgKQEAgLTI1MSw4ICsyNTEsOCBAQCBzdHJ1Y3QgcHBfc211X2Z1bmNzX252IHsKIAogI2RlZmlu
ZSBQUF9TTVVfTlVNX1NPQ0NMS19EUE1fTEVWRUxTICA4CiAjZGVmaW5lIFBQX1NNVV9OVU1fRENG
Q0xLX0RQTV9MRVZFTFMgIDgKLSNkZWZpbmUgUFBfU01VX05VTV9GQ0xLX0RQTV9MRVZFTFMgICAg
OAotI2RlZmluZSBQUF9TTVVfTlVNX01FTUNMS19EUE1fTEVWRUxTICA4CisjZGVmaW5lIFBQX1NN
VV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDQKKyNkZWZpbmUgUFBfU01VX05VTV9NRU1DTEtfRFBN
X0xFVkVMUyAgNAogCiBzdHJ1Y3QgZHBtX2Nsb2NrIHsKICAgdWludDMyX3QgIEZyZXE7ICAgIC8v
IEluIE1IegotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
