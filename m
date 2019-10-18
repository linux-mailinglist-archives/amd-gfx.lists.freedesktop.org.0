Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B54DD099
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2DD6E03B;
	Fri, 18 Oct 2019 20:49:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757766E03B
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af/GhNjqC7ncZ3kCM6T6vLt222h9CbddT0+ATo3yzxR9+9cOqA7aULkxNe0uu2PPsRfmQdDUCyBxyZzFcqm8Vv1CNDEmkznBcxWosScvzWpD3jT6y0+JZ1wpYnDqVJb95J2OzBTffJe4gjENT2mw//vEQ8cbC3r+oZ6ri1BtHDbcVUXryJnNbqHbu0coKovqbFm3ohqX3d1RMtpivAFuEKPwlvUjJSrMvGtawRth46h1ZY5DChtN0ocDDd0Ld/ZRuEMixv7atRG0e4KeQw+478k+2QEkUN3n0XF1KOtFaBKqIje2i30qGOqSViYG/1vcriba1edeQsfT/NChSwNACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7KvAjhChUcqkphqyzdseNWxNdProRIiFGBtz1vaeJU=;
 b=D9phuErOHE1Gs9wSyXKoMx+NoIbeelJyxycp1mwXVxJmlotLimJty8PcLdCLrYFHQBqAJ7jkdPiF/Z79cMvOGl8Fg/eySWnKug+GZLRP0GtX2nQyaP+sT1y+NyOjGpP82blv7yo6ciZgqxuyqIcnSW7Y7TBjOXPOK77ay5O442yxpSneCvp/VIQcChbKNTC/b/JqwgLDXHW0uJVJR/z6NzbMlha4ptqlRAeWkpv1haHREaAYOTS/1xXD/wTUG547wR7YJw6w9ibP9lHttS1qZcXMqaBbU+TOwUR8x32K+I5Gf95/Vv3YhgVVXQbE2L56ZlUOXXPXdepZjviGNoj8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0067.namprd12.prod.outlook.com (2603:10b6:802:20::38)
 by BYAPR12MB2837.namprd12.prod.outlook.com (2603:10b6:a03:68::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 20:49:46 +0000
Received: from BY2NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by SN1PR12CA0067.outlook.office365.com
 (2603:10b6:802:20::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19 via Frontend
 Transport; Fri, 18 Oct 2019 20:49:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BY2NAM03FT039.mail.protection.outlook.com (10.152.85.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 20:49:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:45 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:45 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 15:49:44 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/4] Add RAS EEPROM table support for Arcturus.
Date: Fri, 18 Oct 2019 16:48:27 -0400
Message-ID: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(199004)(189003)(36756003)(70206006)(44832011)(336012)(54906003)(7696005)(50226002)(81156014)(6916009)(48376002)(316002)(4326008)(5660300002)(70586007)(81166006)(16586007)(8676002)(356004)(2906002)(305945005)(47776003)(8936002)(53416004)(6666004)(2351001)(50466002)(2616005)(186003)(476003)(26005)(478600001)(86362001)(486006)(51416003)(126002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2837; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 221ad143-c84e-4f40-b7fa-08d7540cb613
X-MS-TrafficTypeDiagnostic: BYAPR12MB2837:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2837621BF3FB2181A4327BABEA6C0@BYAPR12MB2837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxDzh0PqxONywKni62JL+CDBxAxT0xStUv6cX1kwikvuAnuwbRaFq/n8GXnl1b0B7BCxExQZXtot/mzcDD1CN0k1xB6mpVtYRJQ5Gz8xRCW2+LKLk+yTndn6qpQ4PSR4vx6Mqv+Y1xp5XzQR+gadsebDlcyuwfLJi5OUUpNxBVbuT2K9AxJmub92JP536W4//SOZH97IIxx3F88CnRPcgUI6Ki5mh6GrFD76zm3vQp/q+llMUGOHIvrpyRNg4YCyn3JrdqfLlbj9MdadrjlfGgyQiXefXKIvZbvhDkMuoXemuQQU4LsYenwQwtZTS3hKnAH7eaF51kMKRk8EyKj6WZqLPgzrQ0CseQmu0Pd6By1eR4kfC+y3OJwPRuD8Hl+U+dtRqzAwcrgNJHJtX1ftbKH+w2rzm5TeJcvbr7Cbxyk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 20:49:46.5199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 221ad143-c84e-4f40-b7fa-08d7540cb613
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2837
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7KvAjhChUcqkphqyzdseNWxNdProRIiFGBtz1vaeJU=;
 b=zlumcbB1JzXhR83z4LAbwbNvikpAc178rjA0OSGAoBOZCown/12c+SmsjVuhwuwiHtbIorNb9Mm5pX+EHu65azQAPvxB7GIHdzvZniXPdTBgdn8/1Gr3lveg9C7P7m70SoW7IOJ56AHCTaZRvqwDMy2RWyeVbrUc8PWgQLaWewI=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Tao.Zhou1@amd.com, noreply-confluence@amd.com, Alexander.Deucher@amd.com,
 Evan.Quan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgYWRkcyBzdXBwb3J0IGZvciBBcmN0dXJ1cyBFRVBST00gdG8gc3RvcmUg
UkFTIAplcnJvcnMgd2hpY2ggcmlzZSBkdXJpbmcgcnVuIHRpbWUgc28gb24gbmV4dCBkcml2ZXIg
bG9hZCB0aG9zZSAKZXJyb3JzIGNhbiBiZSByZXRyaWV2ZWQgYW5kIGFjdGlvbiB0YWtlbiBvbiB0
aGVtIAooZS5nLiBSZXNlcnZlIGJhZCBtZW1vcnkgcGFnZXMgdG8gZGlzYWxsb3cgdGhlaXIgdXNh
Z2UgYnkgdGhlIEdQVSkuCgpUaGUgSTJDIGNvbW11bmljYXRpb24gaXMgZG9uZSB0aHJvdWdoIFNN
VSB0YWJsZSAgd2hpY2ggaXMgd2hhdCBpbiBwYXRjaCAyCndoaWxlIHBhdGNoIDQgcmVsb2NhdGVz
IFJBUyByZWNvdmVyeSBpbml0IHRvIG11Y2ggbGF0ZXIgcGxhY2UgdGhlbiBiZWZvcmUKc2luY2Ug
U01VIG11c3QgYmUgZnVsbHkgb3BlcmF0aW9uYWwgZm9yIHRoaXMgdG8gd29yayBvbiBBcmN0dXJ1
cy4KCgpBbmRyZXkgR3JvZHpvdnNreSAoNCk6CiAgZHJtL2FtZC9wb3dlcnBsYXk6IEFkZCBpbnRl
cmZhY2UgZm9yIEkyQyB0cmFuc2FjdGlvbnMgdG8gU01VLgogIGRybS9hbWQvcG93ZXJwbGF5OiBB
ZGQgRUVQUk9NIEkyQyByZWFkL3dyaXRlIHN1cHBvcnQgdG8gQXJjdHVydXMuCiAgZHJtL2FtZGdw
dTogVXNlIEFSQ1RVUlVTIGluIFJBUyBFRVBST00uCiAgZHJtL2FtZGdwdTogTW92ZSBhbWRncHVf
cmFzX3JlY292ZXJ5X2luaXQgdG8gYWZ0ZXIgU01VIHJlYWR5LgoKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICAgfCAgMTMgKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCAgIDkgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICAgfCAgMTEgLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jICAgfCAyMjkgKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8ICAg
OSArCiA1IGZpbGVzIGNoYW5nZWQsIDI1OSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
